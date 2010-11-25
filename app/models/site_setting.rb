class SiteSetting < ActiveRecord::Base
  
  VALUE_TYPES = ["string", "integer", "float", "text", "boolean"]
  
   
  validates :name, :presence => true
  validates :setting_key, :presence => true, :uniqueness => true
  validates :setting_value, :presence => true
  
  
  scope :product_module, where(:module => "product")

      
  class << self
    def got key
      find_by_setting_key(key.to_s.to_sym).setting_value rescue ""
    end          
  end
  
end
