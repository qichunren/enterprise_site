class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :name, :null => false
      t.integer :download_count, :default => 0
      t.text :descripton
      
      # for paperclip gem: has_attached_file :attach
      t.string    :attach_file_name
      t.string    :attach_content_type
      t.integer   :attach_file_size
      t.datetime  :attach_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
