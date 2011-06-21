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

# == Schema Information
#
# Table name: navmenus
#
#  id                 :integer(4)      not null, primary key
#  label              :string(255)     not null
#  url                :string(255)     not null
#  link_title         :string(255)     not null
#  position           :integer(4)      default(0), not null
#  is_display         :boolean(1)      default(TRUE), not null
#  open_in_new_window :boolean(1)      default(FALSE), not null
#  created_at         :datetime
#  updated_at         :datetime
#

