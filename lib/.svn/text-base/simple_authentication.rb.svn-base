module SimpleAuthentication
  
  protected
  
  def self.login(base, identity_url)
    if blog = Blog.find_by_identity_url(identity_url)
      base.current_blog = blog
      return true, "you are now logged in"
    else
      blog = Blog.create(:identity_url => identity_url)
      base.current_blog = blog
      return true, "thanks for signing-in with BLOG!"
    end
  end
  
  def self.logout(base)
    @current_blog = false
    base.session[:blog_id] = nil
  end
  
  def logged_in?
    !!current_blog
  end
  
  def current_blog
    @current_blog ||= login_from_session unless @current_blog == false
  end

  def current_blog=(blog)
    session[:blog_id] = blog ? blog.id : nil
    @current_blog = blog || false
  end
  
  def login_from_session
    self.current_blog = Blog.find_by_id(session[:blog_id]) if session[:blog_id]
  end
  
  def login_required
    logged_in? || access_denied
  end
  
  def access_denied
    flash[:error] = "please log-in!"
    redirect_to homepage_url
  end
  
  def self.included(base)
    base.send :helper_method, :current_blog, :logged_in? if base.respond_to? :helper_method
  end
  
end