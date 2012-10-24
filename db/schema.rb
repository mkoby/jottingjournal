# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121021181944) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.text     "contents"
    t.binary   "entry_hash"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_favorite", :default => false
  end

  add_index "entries", ["is_favorite"], :name => "index_entries_on_is_favorite"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "entry_locations", :force => true do |t|
    t.integer  "entry_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "zipcode"
  end

  add_index "entry_locations", ["entry_id"], :name => "index_entry_locations_on_entry_id"

  create_table "entry_photos", :force => true do |t|
    t.integer  "entry_id"
    t.string   "photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entry_photos", ["entry_id"], :name => "index_entry_photos_on_entry_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
