class Navmenu < ActiveRecord::Base
  
  scope :availble, :conditions => ["is_display = ?", true], :order => "position"
end
