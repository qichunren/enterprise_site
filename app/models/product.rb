class Product < ActiveRecord::Base
  
  
  belongs_to :category
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "120x90" }
  
  validates :name, :presence => true
  
  before_save do |product|
    raise "Product must belongs to a child category!" unless product.category.children.blank?
  end
  
  scope :published, :conditions => ["is_published=true", true], :order => "id DESC"
  
end
