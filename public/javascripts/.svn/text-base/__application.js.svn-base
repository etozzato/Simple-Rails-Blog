// Adds the .js mime to URLs, so that Rails fires the correct respond_to response.
var mimeifyUrl = function(url){
	if (/\.js/.test(url)){
		return url
	} else if (/\?/.test(url)) {
		return url.replace('?', '.js?')
	} else {
		return url + '.js'
	}
}

$.ajaxSetup({
	complete: function(response, status){
		$('#loading_indicator').hide()
	},
	error: function(){
		alert('An error occured!') // replace this with your own awesome error handler
	},
	beforeSend: function(request, params){
		$('#loading_indicator').show()
	}
});

// Similar to the built in 'load' function in jQuery, extended so that it adds the .js mime to
// the url.
$.fn.railsLoad = function(location){
  var self = this;
  $.ajax({
    url: mimeifyUrl(location),
    success: function(response, status){
      $(self).html(response);
    }
  });
}

// A function passed to the jQuery function - $(function()) - shorthand for $(document).ready(). Runs it on window.onload (which is the same as <body onload="foo()">)
$(function(){
  
  // All will_paginate entities in the DOM gets ajaxified with livequery (http://ozmm.org/posts/ajax_will_paginate_jq_style.html)
  $('div.pagination a').livequery('click', function() {
    $('#main').railsLoad(this.href);
    return false;
  });
  
  // Ajaxifying the comment entry form. We need dataType: script for jQuery to eval the returned js.
  $('#search').ajaxForm({dataType: 'script'});
  $('#search').livequery(function(){
    $(this).ajaxForm({dataType: 'script'});
  });
})