class BlogsController < ApplicationController
  
  def index
    @recently_updated = Blog.recently_updated
    @popular_posts = Post.popular 
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
      flash[:error] = "The blog you requested was not found. Did the name change?"
      redirect_to blogs_url and return
    end
    @blog.remember(self)
    if params[:archive]
      render :action => 'archive'
    end
    
    if params[:post]
      @post = @blog.posts.find_by_seo_id_and_is_public(params[:post], true)
      unless @post
        flash[:error] = "The post you requested was not found."
        redirect_to blog_url(@blog.seo_id) and return
      end
    else
      @posts = @blog.posts.public.paginate(:page => params[:page] || 1, :per_page => 10)
    end
    
  end

end
