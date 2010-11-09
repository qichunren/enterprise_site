class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table "admins", :force => true do |t|
      t.string   "login",                   :limit => 200,                                 :null => false
      t.string   "email",                   :limit => 200
      t.string   "crypted_password",        :limit => 200,                                  :null => false
      t.string   "password_salt",           :limit => 200,                                  :null => false
      
      t.string   "persistence_token",       :limit => 200,                                  :null => false
      t.string   "single_access_token",     :limit => 200,                                  :null => false
      
      t.integer   "dept",        :limit => 2,                                               :null => false 
      t.boolean   "super_admin", :default => false
      
      t.datetime  "last_login_at"
      t.string    "last_login_ip"
      
      t.datetime "last_change_at"
      t.integer  "login_count",               :default => 1
      
      t.timestamps
    end
    
    add_index :admins, :login
    add_index :admins, :persistence_token
    add_index :admins, :last_login_at
  end

  def self.down
    remove_index :admins, :login
    remove_index :admins, :persistence_token
    remove_index :admins, :last_login_at
    
    drop_table "admins"
  end
end
