class Blog < ActiveRecord::Base
  
  has_many :posts, :order => "published_at DESC, created_at DESC"
  
  after_create :set_temporary_name
  before_update :set_seo_id
  
  validates_presence_of   :name, :on => :update
  validates_uniqueness_of :name, :allow_nil => true
  #validates_format_of     :name, :with => /^[a-zA-Z0-9]+$/, :message => "special characters not allowed!", :on => :update
  
  named_scope :recently_updated, :order => "posts_count DESC, updated_at DESC", :conditions => "posts_count > 0", :limit => 10
  
  def set_temporary_name
    update_attribute(:name, "Unamed Blog #{"%05d" % self.id}")
  end
  
  def set_seo_id
    self.seo_id = self.name.downcase.to_alphanum(true).gsub(' ', '-').squeeze("-")
  end

  def public_count
    self.posts.public.count
  end
  
  def public_posts
    self.posts.public.find(:all, :limit => 5, :order => "published_at DESC")
  end
  
  def remember(base)
    base.session[:last_visited_blog_id] =  self.id
    base.session[:last_visited_blog_seo] =  self.seo_id
  end
  
  def self.search(params)
    unless params[:blog_name].blank?
      find_by_name(params[:blog_name])
    end
  end
  
  def self.locate(base)
    if !base.session[:last_visited_blog_id].nil? && base.params[:blog] == base.session[:last_visited_blog_seo]
      return Blog.find_by_id(base.session[:last_visited_blog_id])
    end
  end
  
end
