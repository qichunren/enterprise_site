class Page < ActiveRecord::Base                               
  validates :title, :presence => true
  validates :url_slug, :presence => true, :uniqueness => true 
  validates :body, :presence => true                         
                     
  # TODO,is this enough, I only want english worlds.
  validates_format_of :url_slug, :with => /^\w+$/
  
  scope :published, :conditions => ["is_published=?", true], :order => "url_slug"
end
