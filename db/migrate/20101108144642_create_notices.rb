class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.string :title, :null => false
      t.text :body
      t.integer :click_count,   :default => 1
      t.boolean :is_published,  :default => true
      t.string :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
