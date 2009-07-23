class Post < ActiveRecord::Base

  belongs_to :blog, :counter_cache => true
  
  validates_presence_of :title, :body
  
  named_scope :public, :conditions => "published_at IS NOT NULL" 
  
  def toggle_status
    toggle(:is_public)
    update_attribute(:published_at, self.is_public? ? Time.now : nil)
  end
  
end