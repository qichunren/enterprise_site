class CreateNavmenus < ActiveRecord::Migration
  def self.up
    create_table :navmenus do |t|
      t.string :label, :null => false
      t.string :url, :null => false
      t.string :link_title, :null => false
      t.integer :position, :null => false, :default => 0
      t.boolean :is_display, :null => false, :default => true
      t.boolean :open_in_new_window, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :navmenus
  end
end
