class CreateSiteSettings < ActiveRecord::Migration
  
  def self.up
    create_table :site_settings do |t|
      t.string :name, :null => false
      t.string :setting_key, :null => false
      t.text   :setting_value, :null => false
      t.string :remark
      t.string :value_type, :null => false
      
      t.boolean :build_in, :null => false

      t.timestamps
    end
    
    add_index :site_settings, :setting_key
  end

  def self.down
    drop_table :site_settings
  end
end
