class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :title
      t.string :target_url, :null => false
      t.string :image_url
      t.integer :click_count, :default => 0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
