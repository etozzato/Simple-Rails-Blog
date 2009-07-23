class Dashboard::PostsController < ApplicationController
  
  before_filter :login_required

  def create
    @post = current_blog.posts.new(params[:post])
    @post.toggle_status if params[:is_public] == "true"
    
    if @post.save
      flash[:notice] = "Post '<em>#{@post.title}</em>' has #{@post.is_public? ? 'been published' : 'been saved as a draft'}"
      redirect_to dashboard_url      
    else
      flash[:error] = "Post '<em>#{@post.title}</em>' has not been created"
      render :action => "new" and return
    end
  
  end
  
  def edit
    @post = Post.find_by_id_and_blog_id(params[:id],current_blog)
    unless @post
      flash[:error] = "Record not Found!"
      redirect_to dashboard_url and return   
    end
  end
  
  def update
    @post = Post.find_by_id_and_blog_id(params[:id],current_blog)
    unless @post
      flash[:error] = "Record not Found!"
      redirect_to dashboard_url and return   
    end
    @post.attributes = params[:post]
    if @post.save
      flash[:notice] = "Post '<em>#{@post.title}</em>' has been updated"
      redirect_to dashboard_url and return   
    else
      flash[:error] = "Post '<em>#{@post.title}</em>' has not been updated"
      render :action => "edit" and return
    end
    
  end
  
  def destroy
    @post = Post.find_by_id_and_blog_id(params[:id],current_blog)
    unless @post
      flash[:error] = "Record not Found!"
    end
    @post.destroy
    flash[:notice] = "Post '<em>#{@post.title}</em>' was deleted"
    redirect_to dashboard_url  
  end
  
  def toggle
    @post = Post.find_by_id_and_blog_id(params[:id],current_blog)
    unless @post
      flash[:error] = "Record not Found!"
      redirect_to dashboard_url and return   
    end
    @post.toggle_status
    flash[:notice] = "Post '<em>#{@post.title}</em>' has #{@post.is_public? ? 'been published' : 'been saved as a draft'}"
    redirect_to dashboard_url
  end
  
end
