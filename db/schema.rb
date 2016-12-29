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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161229132754) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_players"
    t.integer  "max_players"
    t.time     "game_time"
    t.string   "lang"
    t.string   "description"
    t.string   "image_url"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "table_players", force: :cascade do |t|
    t.integer  "table_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_table_players_on_table_id"
    t.index ["user_id"], name: "index_table_players_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tables_on_event_id"
    t.index ["game_id"], name: "index_tables_on_game_id"
    t.index ["user_id"], name: "index_tables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
