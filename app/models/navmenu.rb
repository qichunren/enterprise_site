class Navmenu < ActiveRecord::Base
  
  default_scope :order => "position" 
  
  validates :label, :presence => true
  validates :url,   :presence => true
  
  scope :availble, :conditions => ["is_display = ?", true], :order => "position" 
  
  before_save :set_link_title
  
  
  private
  
  def set_link_title
    if self.link_title.blank?
      self.link_title = self.label
    end
  end
end
