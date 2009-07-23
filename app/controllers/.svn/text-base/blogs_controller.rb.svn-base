class BlogsController < ApplicationController
  
  def index
    @recently_updated = Blog.recently_updated
  end
  
  def search
    @blog = Blog.search(params)
  end
  
  def show
    @blog = Blog.find_by_seo_id(params[:blog])
    unless @blog
      # if name was changed while reading.. try with last id/seo
      blog = Blog.locate(self)
      if blog
        flash[:warning] = "This blog has changed name to #{blog.name}!"
        redirect_to blog_url(blog.seo_id)  and return unless params[:archive]
        redirect_to blog_url(blog.seo_id, :archive => true) and return
      end
      session[:last_visited_blog_id] = session[:last_visited_blog_seo] = nil
      flash[:error] = "Blog not Found!"
      redirect_to blogs_url and return
    end
    @blog.remember(self)
    if params[:archive]
      render :action => 'archive'
    end
  end
  
end
