class News < ActiveRecord::Base 
  
  validates :title, :presence => true
  validates :body,  :presence => true
  
  before_create :set_created_by
  
  def set_created_by
    self.created_by = Admin.current.login
  end
end
