class News < ActiveRecord::Base 
  
  validates :title, :presence => true
  validates :body,  :presence => true
  
  before_create :set_created_by
  
  def set_created_by
    if self.created_by.blank?
      self.created_by = Admin.current.login rescue "Unknow"
    end
  end
end

# == Schema Information
#
# Table name: news
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)     not null
#  body        :text            default(""), not null
#  click_count :integer(4)      default(0), not null
#  created_by  :string(255)     not null
#  created_at  :datetime
#  updated_at  :datetime
#

