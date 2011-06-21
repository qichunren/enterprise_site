class Page < ActiveRecord::Base                               
  validates :title, :presence => true
  validates :url_slug, :presence => true, :uniqueness => true 
  validates :body, :presence => true                         
                     
  # TODO,is this enough, I only want english worlds.
  validates_format_of :url_slug, :with => /^\w+$/
  
  scope :published, :conditions => ["is_published=?", true], :order => "url_slug"
         
  # 访问路径
  def visit_path
    "/pages/#{self.url_slug}"
  end
end

# == Schema Information
#
# Table name: pages
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)     not null
#  keywords     :string(255)
#  description  :string(255)
#  body         :text
#  url_slug     :string(255)     not null
#  created_by   :string(255)
#  is_published :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#

