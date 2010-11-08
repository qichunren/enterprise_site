class CreateSiteSettings < ActiveRecord::Migration
  def self.up
    create_table :site_settings do |t|
      t.string :name, :null => false
      t.string :setting_key, :null => false
      t.string :setting_value, :null => false
      t.string :remark
      t.string :value_type

      t.timestamps
    end
  end

  def self.down
    drop_table :site_settings
  end
end
