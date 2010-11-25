# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101111112445) do

  create_table "admins", :force => true do |t|
    t.string   "login",               :limit => 200,                    :null => false
    t.string   "email",               :limit => 200
    t.string   "crypted_password",    :limit => 200,                    :null => false
    t.string   "password_salt",       :limit => 200,                    :null => false
    t.string   "persistence_token",   :limit => 200,                    :null => false
    t.string   "single_access_token", :limit => 200,                    :null => false
    t.integer  "dept",                :limit => 2,                      :null => false
    t.boolean  "super_admin",                        :default => false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.datetime "last_change_at"
    t.integer  "login_count",                        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["last_login_at"], :name => "index_admins_on_last_login_at"
  add_index "admins", ["login"], :name => "index_admins_on_login"
  add_index "admins", ["persistence_token"], :name => "index_admins_on_persistence_token"

  create_table "attachments", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "download_count",      :default => 0
    t.text     "descripton"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "user_name",                          :null => false
    t.string   "email",                              :null => false
    t.string   "phone"
    t.string   "user_ip"
    t.string   "website"
    t.text     "body"
    t.boolean  "is_read",         :default => false
    t.boolean  "is_public",       :default => false
    t.text     "replied_content"
    t.datetime "replied_at"
    t.string   "replied_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navmenus", :force => true do |t|
    t.string   "label",                                 :null => false
    t.string   "url",                                   :null => false
    t.string   "link_title",                            :null => false
    t.integer  "position",           :default => 0,     :null => false
    t.boolean  "is_display",         :default => true,  :null => false
    t.boolean  "open_in_new_window", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title",                      :null => false
    t.text     "body",                       :null => false
    t.integer  "click_count", :default => 0, :null => false
    t.string   "created_by",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", :force => true do |t|
    t.string   "title",                          :null => false
    t.text     "body"
    t.integer  "click_count",  :default => 1
    t.boolean  "is_published", :default => true
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title",                          :null => false
    t.string   "keywords"
    t.string   "description"
    t.text     "body"
    t.string   "url_slug",                       :null => false
    t.string   "created_by"
    t.boolean  "is_published", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                                 :null => false
    t.integer  "category_id",                                                          :null => false
    t.string   "product_no"
    t.text     "description"
    t.integer  "click_count",                                        :default => 1
    t.decimal  "price",               :precision => 10, :scale => 0
    t.integer  "amount"
    t.boolean  "is_published",                                       :default => true
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "site_settings", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "setting_key",   :null => false
    t.text     "setting_value", :null => false
    t.string   "remark"
    t.string   "value_type",    :null => false
    t.boolean  "build_in",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_settings", ["setting_key"], :name => "index_site_settings_on_setting_key"

end
