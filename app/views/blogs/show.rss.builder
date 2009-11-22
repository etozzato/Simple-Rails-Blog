# index.rss.builder
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "MekDigital Blog: #{@blog.name}"
    xml.description "#{@blog.name} by Emanuele Mekdigital Tozzato"
    xml.link formatted_blog_url(@blog.seo_id, :rss)
    if @posts
      for post in @posts
        xml.item do
          xml.title post.title.titleize
          xml.description add_breaks(auto_link((post.body), :all, :target => "_blank"))
          xml.pubDate post.published_at.to_s(:rfc822)
          xml.link blog_post_url(@blog.seo_id, post.seo_id)
          xml.guid blog_post_url(@blog.seo_id, post.seo_id)
        end
      end
    end
  end
end