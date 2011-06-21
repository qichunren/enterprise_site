class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title, :null => false
      t.string :keywords
      t.string :description
      t.text :body
      t.string :url_slug, :null => false
      t.string :created_by
      t.boolean :is_published, :default => true

      t.timestamps
    end
    
    add_index :pages, :title
  end

  def self.down
    drop_table :pages
  end
end
