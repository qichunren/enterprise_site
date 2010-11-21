class SiteSetting < ActiveRecord::Base
  
   
  validates :name, :presence => true
  validates :setting_key, :presence => true, :uniqueness => true
  validates :setting_value, :presence => true

  class_eval do
    self.all.each do |record|
      define_method("self." + record.setting_key) do
        record.setting_value
      end
    end
  end
end
