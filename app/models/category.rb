class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :products 
  
  validates :name, :presence => true
         
  # 取产品分类级别
  def self.category_level
    find(:first, :order => "depth DESC", :select => "depth").depth
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  parent_id  :integer(4)
#  lft        :integer(4)
#  rgt        :integer(4)
#  depth      :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

