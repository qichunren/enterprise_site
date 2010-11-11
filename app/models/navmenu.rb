class Navmenu < ActiveRecord::Base 
  
  validates :label, :presence => true
  validates :url,   :presence => true
  
  scope :availble, :conditions => ["is_display = ?", true], :order => "position"
  
  def before_save
    if self.link_title.blank?
      self.link_title = self.label
    end
  end
end
