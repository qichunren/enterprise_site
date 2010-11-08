class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  before_save do |product|
    raise "Product must belongs to a child category!" unless product.category.children.blank?
  end
end
