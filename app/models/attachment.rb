class Attachment < ActiveRecord::Base
  validates :attach_file_name, :presence => true
  has_attached_file :attach
end
