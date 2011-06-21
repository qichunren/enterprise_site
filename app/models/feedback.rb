class Feedback < ActiveRecord::Base 
  validates :body, :presence => true
  validates :email, :presence => true
end

# == Schema Information
#
# Table name: feedbacks
#
#  id              :integer(4)      not null, primary key
#  user_name       :string(255)     not null
#  email           :string(255)     not null
#  phone           :string(255)
#  user_ip         :string(255)
#  website         :string(255)
#  body            :text
#  is_read         :boolean(1)      default(FALSE)
#  is_public       :boolean(1)      default(FALSE)
#  replied_content :text
#  replied_at      :datetime
#  replied_by      :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

