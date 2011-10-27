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

ActiveRecord::Schema.define(:version => 20111027021902) do

  create_table "games", :force => true do |t|
    t.integer  "match_id"
    t.integer  "winner_id"
    t.integer  "map_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_pools", :force => true do |t|
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.integer  "map_pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "round_id"
    t.integer  "winner_id"
    t.integer  "group"
    t.time     "reported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "best_of"
  end

  create_table "players", :force => true do |t|
    t.integer  "match_id"
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "season_id"
    t.integer  "user_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "position"
    t.time     "starts_at"
    t.time     "ends_at"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "best_of"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smf2rc4_members", :primary_key => "id_member", :force => true do |t|
    t.string  "member_name"
    t.string  "email_address"
    t.string  "passwd"
    t.integer "id_group"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "smf_id"
    t.boolean  "admin"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bnet_name"
    t.string   "bnet_code"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["smf_id"], :name => "index_users_on_smf_id"

end
