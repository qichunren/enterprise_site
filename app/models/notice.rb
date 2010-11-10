class Notice < ActiveRecord::Base
  scope :published, :conditions => ["is_published=true", true], :order => "id DESC"
  
  validates :title, :presence => true
  
  def read!
    self.click_count = self.click_count + 1
    self.save
  end
end
