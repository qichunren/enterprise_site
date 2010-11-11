class News < ActiveRecord::Base 
  
  validates :title, :presence => true
  validates :body,  :presence => true
  
  def before_create
    self.created_by = Admin.current.login
  end
end
