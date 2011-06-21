class Notice < ActiveRecord::Base
  scope :published, :conditions => ["is_published=true", true], :order => "id DESC"
  
  validates :title, :presence => true    
  validates :body,  :presence => true
  
  def read!
    self.click_count = self.click_count + 1
    self.save
  end
end

# == Schema Information
#
# Table name: notices
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)     not null
#  body         :text
#  click_count  :integer(4)      default(1)
#  is_published :boolean(1)      default(TRUE)
#  created_by   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

