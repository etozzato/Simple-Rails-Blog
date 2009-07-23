class PostsController < ApplicationController
  
  def show
    # always public for the author
    @post = Post.find(:first, :conditions => ["id = ? AND (is_public = ? OR blog_id = ?)", params[:id], 1, current_blog])
    unless @post
      flash[:error] = "Post not Found!"
      redirect_to blogs_url and return
    end
  end
  
end
