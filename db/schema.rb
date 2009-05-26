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

ActiveRecord::Schema.define(:version => 99) do

  create_table "chats", :force => true do |t|
    t.integer  "player_id",  :null => false
    t.integer  "match_id",   :null => false
    t.string   "text"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chats", ["match_id"], :name => "index_chats_on_match_id"
  add_index "chats", ["player_id"], :name => "index_chats_on_player_id"
  add_index "chats", ["sent_at"], :name => "index_chats_on_sent_at"

  create_table "friends", :force => true do |t|
    t.string   "kind"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gameplays", :force => true do |t|
    t.integer  "player_id",                                   :null => false
    t.integer  "match_id",                                    :null => false
    t.boolean  "black",                    :default => false
    t.string   "move_queue", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gameplays", ["match_id", "player_id"], :name => "index_gameplays_on_player_id_and_match_id"
  add_index "gameplays", ["player_id"], :name => "index_gameplays_on_player_id"

  create_table "matches", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.string   "name"
    t.string   "state"
    t.boolean  "active"
    t.string   "start_pos",  :limit => 100
    t.string   "result",     :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["active"], :name => "index_matches_on_active"
  add_index "matches", ["winner_id"], :name => "index_matches_on_winner_id"

  create_table "messages", :force => true do |t|
    t.integer  "from_id",                       :null => false
    t.integer  "to_id",                         :null => false
    t.integer  "parent_id"
    t.string   "subject",                       :null => false
    t.text     "body",                          :null => false
    t.boolean  "read",       :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["from_id"], :name => "index_messages_on_from_id"
  add_index "messages", ["parent_id"], :name => "index_messages_on_parent_id"
  add_index "messages", ["read"], :name => "index_messages_on_read"
  add_index "messages", ["to_id"], :name => "index_messages_on_to_id"

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

  create_table "openings", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "move_queue", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "openings", ["move_queue"], :name => "index_openings_on_move_queue", :unique => true
  add_index "openings", ["name"], :name => "index_openings_on_name", :unique => true

  create_table "players", :force => true do |t|
    t.string  "name",        :limit => 20
    t.integer "rating"
    t.integer "wins"
    t.integer "loses"
    t.integer "fics_rating"
  end

  add_index "players", ["name"], :name => "index_players_on_name", :unique => true
  add_index "players", ["rating"], :name => "index_players_on_rating"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subscriptions", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["player_id", "tournament_id"], :name => "index_subscriptions_on_tournament_id_and_player_id"
  add_index "subscriptions", ["player_id"], :name => "index_subscriptions_on_player_id"
  add_index "subscriptions", ["rank"], :name => "index_subscriptions_on_rank"
  add_index "subscriptions", ["tournament_id"], :name => "index_subscriptions_on_tournament_id"

  create_table "tournaments", :force => true do |t|
    t.integer  "winner_id"
    t.string   "name",       :null => false
    t.string   "kind"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["kind"], :name => "index_tournaments_on_kind"
  add_index "tournaments", ["name"], :name => "index_tournaments_on_name"
  add_index "tournaments", ["start_at"], :name => "index_tournaments_on_start_at"
  add_index "tournaments", ["winner_id"], :name => "index_tournaments_on_winner_id"

  create_table "tutorials", :force => true do |t|
    t.string   "name"
    t.text     "move_queue"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tutorials", ["created_at"], :name => "index_tutorials_on_created_at"
  add_index "tutorials", ["name"], :name => "index_tutorials_on_name"

  create_table "users", :force => true do |t|
    t.integer  "player_id"
    t.string   "login",               :limit => 30,                         :null => false
    t.string   "kind",                :limit => 20,                         :null => false
    t.string   "email",               :limit => 100
    t.string   "name",                :limit => 100
    t.string   "state",                              :default => "passive", :null => false
    t.string   "fics_login",          :limit => 50
    t.string   "fics_password",       :limit => 50
    t.string   "time_zone",           :limit => 50,                         :null => false
    t.string   "locale",              :limit => 50,                         :null => false
    t.string   "crypted_password",                                          :null => false
    t.string   "password_salt",                                             :null => false
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "last_login_at"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.integer  "login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["kind"], :name => "index_users_on_kind"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["single_access_token"], :name => "index_users_on_single_access_token"

end
