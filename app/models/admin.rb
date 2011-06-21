# encoding: utf-8
class Admin < ActiveRecord::Base

  validates :login, :presence => true, :uniqueness => true

  acts_as_authentic do |c|
  end

  before_create do |admin|
    admin.dept = 0
  end
  
  # use current admin in model layer
  def self.current
    Thread.current[:admin]
  end
  
  # set current admin in model layer
  def self.current=(admin)
    Thread.current[:admin] = admin
  end

  
end

# == Schema Information
#
# Table name: admins
#
#  id                  :integer(4)      not null, primary key
#  login               :string(200)     not null
#  email               :string(200)
#  crypted_password    :string(200)     not null
#  password_salt       :string(200)     not null
#  persistence_token   :string(200)     not null
#  single_access_token :string(200)     not null
#  dept                :integer(2)      not null
#  super_admin         :boolean(1)      default(FALSE)
#  last_login_at       :datetime
#  last_login_ip       :string(255)
#  last_change_at      :datetime
#  login_count         :integer(4)      default(1)
#  created_at          :datetime
#  updated_at          :datetime
#

