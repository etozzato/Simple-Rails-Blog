var mimeifyUrl = function(url){
	if (/\.js/.test(url)){
		return url
	} else if (/\?/.test(url)) {
		return url.replace('?', '.js?')
	} else {
		return url + '.js'
	}
}

$.fn.railsLoad = function(location){
  var self = this;
  $.ajax({
    url: mimeifyUrl(location),
    success: function(response, status){
      $('#loading_indicator').hide();
      $(self).html(response);
    }
  });
}

$.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

$.ajaxSetup({
  complete: function(response, status){
    $('#loading_indicator').hide()
  },
  error: function(){
    alert('An error occured!')
  },
  beforeSend: function(request, params){
    $('#loading_indicator').show()
  }
});

$(function(){
  
  $('div.pagination a').livequery('click', function() {
    $('#container').railsLoad(this.href);
    return false;
  });
  
  $('#search').livequery(function(){
    $(this).ajaxForm({dataType: 'script'});
  });

})