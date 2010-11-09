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
