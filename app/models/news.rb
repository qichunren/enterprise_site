class News < ActiveRecord::Base
  def before_create
    self.created_by = Admin.current.login
  end
end
