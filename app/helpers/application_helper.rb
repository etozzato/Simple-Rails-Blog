# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def h_date(date)
    unless date
      "n/a"
    else
      date.strftime("%b %d %Y, %I:%M %p")
    end
  end
  
  def add_breaks(text)
  text.gsub(/\r/, '').gsub(/[\n]/, '<br />').gsub(/(\<br \/>){3,}/, "<br /><br />").gsub(/(\<p>&nbsp;<\/p>){3,}/, "<p>&nbsp;</p><p>&nbsp;</p>")
  end

  def tag_cloud(collection, classes)
    return if collection.empty?
    max = collection.first.item_count
    collection = collection.sort_by(&:rand)
    
    collection.each do |item|
      index = ((item.item_count / max) * (classes.size - 1)).round
      yield item, classes[index]
    end
  end
  
end
