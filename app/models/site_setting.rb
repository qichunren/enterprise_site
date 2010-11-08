class SiteSetting < ActiveRecord::Base

  class_eval do
    self.all.each do |record|
      define_method("self." + record.setting_key) do
        record.setting_value
      end
    end
  end
end
