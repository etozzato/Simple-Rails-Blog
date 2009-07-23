class Dashboard::BlogController < ApplicationController
  
  before_filter :login_required
  
  def index
    load_posts
  end
  
  def update
    @blog = Blog.find(current_blog)
    if params[:blog_name] 
      @blog.name = params[:blog_name].strip
      if @blog.save
        current_blog.attributes = @blog.attributes
        flash[:notice] = "Blog name was updated"
      else
        flash[:error] = "Blog name was not updated"
        render :action => "edit" and return
      end
    else
      flash[:warning] = "Please select a name!"
      render :action => "edit" and return
    end
    load_posts
    render :action => "index"
  end
  
  protected
  def load_posts
    @posts = current_blog.posts.paginate :page => params[:page], :order => "created_at DESC", :per_page => 10
  end
  
end
