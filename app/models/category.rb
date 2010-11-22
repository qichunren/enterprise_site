class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :products 
  
  validates :name, :presence => true
         
  # 取产品分类级别
  def self.category_level
    find(:first, :order => "depth DESC", :select => "depth").depth
  end
end
