class SessionController < ApplicationController
  
  def create
    
    if Rails.env.development?
      SimpleAuthentication.force_login(self)
      redirect_to dashboard_url and return
    end
    
    authenticate_with_open_id do |result, identity_url|
      if result.successful?
        result, msg = SimpleAuthentication.login(self, identity_url)
        flash[:notice] = msg
        redirect_to dashboard_url and return
      else
        flash[:error] = result.message
        redirect_to homepage_url and return
      end
    end
  end
  
  def destroy
    SimpleAuthentication.logout(self)
    redirect_to homepage_url
  end
  
end
