class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :null => false
      t.integer :category_id, :null => false
      t.string :product_no
      t.text :description
      t.integer :click_count, :default => 0
      t.decimal :price
      t.integer :amount
      t.boolean :is_published, :default => true
      t.string :created_by

      t.timestamps
    end
    
    add_index :products, :name
    add_index :products, :product_no
  end

  def self.down
    drop_table :products
  end
end
