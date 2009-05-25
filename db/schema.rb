# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090525081807) do

  create_table "chats", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "match_id",   :null => false
    t.string   "text"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chats", ["match_id"], :name => "index_chats_on_match_id"
  add_index "chats", ["sent_at"], :name => "index_chats_on_sent_at"
  add_index "chats", ["user_id"], :name => "index_chats_on_user_id"

  create_table "friends", :force => true do |t|
    t.string   "kind"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gameplays", :force => true do |t|
    t.integer  "user_id",                                     :null => false
    t.integer  "match_id",                                    :null => false
    t.boolean  "black",                    :default => false
    t.string   "move_queue", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gameplays", ["match_id", "user_id"], :name => "index_gameplays_on_user_id_and_match_id"
  add_index "gameplays", ["user_id"], :name => "index_gameplays_on_user_id"

  create_table "geometry_columns", :id => false, :force => true do |t|
    t.string  "f_table_catalog",   :limit => 256, :null => false
    t.string  "f_table_schema",    :limit => 256, :null => false
    t.string  "f_table_name",      :limit => 256, :null => false
    t.string  "f_geometry_column", :limit => 256, :null => false
    t.integer "coord_dimension",                  :null => false
    t.integer "srid",                             :null => false
    t.string  "type",              :limit => 30,  :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.string   "name"
    t.boolean  "active"
    t.string   "start_pos",  :limit => 100
    t.string   "result",     :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["active"], :name => "index_matches_on_active"
  add_index "matches", ["winner_id"], :name => "index_matches_on_winner_id"

  create_table "moves", :force => true do |t|
    t.integer  "match_id"
    t.integer  "order"
    t.string   "from_coord",           :limit => 10
    t.string   "to_coord",             :limit => 10
    t.string   "string",               :limit => 10
    t.string   "notation",             :limit => 10
    t.integer  "castled"
    t.string   "captured_piece_coord", :limit => 10
    t.string   "promotion_choice",     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moves", ["match_id"], :name => "index_moves_on_match_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :limit => 30,                         :null => false
    t.string   "kind",                :limit => 20,                         :null => false
    t.string   "email",               :limit => 100
    t.string   "name",                :limit => 100
    t.string   "state",                              :default => "passive", :null => false
    t.string   "crypted_password",                                          :null => false
    t.string   "password_salt",                                             :null => false
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "time_zone",           :limit => 50,                         :null => false
    t.string   "locale",              :limit => 50,                         :null => false
    t.datetime "last_login_at"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.integer  "login_count"
    t.integer  "rating"
    t.integer  "wins"
    t.integer  "loses"
    t.integer  "fics_rating"
    t.string   "fics_login"
    t.string   "fics_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["kind"], :name => "index_users_on_kind"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["rating"], :name => "index_users_on_rating"
  add_index "users", ["single_access_token"], :name => "index_users_on_single_access_token"

end
