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

  def tag_cloud(blogs, classes)
    return if blogs.empty?
    blogs = blogs
    max = blogs.first.posts_count
    blogs = blogs.sort_by(&:rand)
    
    blogs.each do |blog|
      index = ((blog.posts_count / max) * (classes.size - 1)).round
      yield blog, classes[index]
    end
  end
  
end
