class Notice < ActiveRecord::Base
  scope :published, :conditions => ["is_published=true", true], :order => "id DESC"
end
