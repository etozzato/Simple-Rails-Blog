class Post < ActiveRecord::Base

  belongs_to :blog, :counter_cache => true
  
  validates_presence_of :title, :body
  
  named_scope :public, :conditions => "published_at IS NOT NULL" 

  before_create :set_seo_id
  
  def toggle_status
    toggle(:is_public)
    update_attribute(:published_at, self.is_public? ? Time.now : nil)
  end

  def set_seo_id
    self.seo_id = self.title.downcase.to_alphanum(true).gsub(' ', '-').squeeze("-")
  end
  
end