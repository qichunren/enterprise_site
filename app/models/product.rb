# encoding: utf-8
class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "120x90" }
  
  validates :name, :presence => true
  
  before_save do |product|
    raise "Product must belongs to a child category!" unless product.category.children.blank?
  end
  
  scope :published, :conditions => ["is_published=true", true], :order => "id DESC"  
  
  def self.recommend_products(limit)
    self.published.find(:all, :limit => limit)
  end
  
end

# == Schema Information
#
# Table name: products
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)     not null
#  category_id         :integer(4)      not null
#  product_no          :string(255)
#  description         :text
#  click_count         :integer(4)      default(0)
#  price               :integer(10)
#  amount              :integer(4)
#  is_published        :boolean(1)      default(TRUE)
#  created_by          :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#

