class Page < ActiveRecord::Base                               
  validates :title, :presence => true
  validates :url_slug, :presence => true, :uniqueness => true 
  validates :body, :presence => true
  
  scope :published, :conditions => ["is_published=true", true], :order => "url_slug"
end
