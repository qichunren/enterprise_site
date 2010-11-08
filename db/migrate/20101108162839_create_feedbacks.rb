class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.string :user_name, :null => false
      t.string :email, :null => false
      t.string :phone
      t.string :user_ip
      t.string :website
      t.text :body
      t.boolean :is_read, :default => false
      t.boolean :is_public, :default => false

      t.text :replied_content
      t.datetime :replied_at
      t.string :replied_by

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
