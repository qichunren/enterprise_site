class Page < ActiveRecord::Base
  validates :url_slug, :presence => true, :uniqueness => true 
  
  scope :published, :conditions => ["is_published=true", true], :order => "url_slug"
end
