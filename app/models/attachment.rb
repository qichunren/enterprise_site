class Attachment < ActiveRecord::Base
  validates :attach_file_name, :presence => true
  has_attached_file :attach
end

# == Schema Information
#
# Table name: attachments
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)     not null
#  download_count      :integer(4)      default(0)
#  description         :text
#  attach_file_name    :string(255)
#  attach_content_type :string(255)
#  attach_file_size    :integer(4)
#  attach_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

