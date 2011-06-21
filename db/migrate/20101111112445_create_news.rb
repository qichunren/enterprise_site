class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title, :null => false
      t.text :body,    :null => false
      t.integer :click_count, :null => false, :default => 0
      t.string :created_by, :null => false

      t.timestamps
    end
    
    add_index :news, :title
  end

  def self.down
    drop_table :news
  end
end
