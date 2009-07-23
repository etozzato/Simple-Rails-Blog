ActionController::Routing::Routes.draw do |map|

  map.resources :session
  map.resources :blogs, :collection => {:search => :post}, :member => 'archive' 
  map.resources :posts, :only => [:show]

  map.homepage '/', :controller => 'blogs'
  map.logout  '/logout', :controller => 'session', :action => 'destroy'
  
  map.root :controller => "blogs"
  
  map.namespace :dashboard do |d|
    d.resources :blog
    d.resources :posts, :member => {:toggle => :get}
  end
  map.dashboard '/dashboard', :controller => "dashboard/blog"
  
  map.blog ':blog', :controller => 'blogs', :action => 'show'
  map.archive ':blog/archive', :controller => 'blogs', :action => 'show', :archive => true
  
end
