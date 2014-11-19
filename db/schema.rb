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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141114021002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.string  "opponent"
    t.integer "home_score"
    t.integer "opponent_score"
    t.boolean "win_result"
    t.date    "date"
    t.integer "home_first_inning"
    t.integer "home_second_inning"
    t.integer "home_third_inning"
    t.integer "home_fourth_inning"
    t.integer "home_fifth_inning"
    t.integer "home_sixth_inning"
    t.integer "home_seventh_inning"
    t.integer "home_eigth_inning"
    t.integer "home_ninth_inning"
    t.integer "opponent_first_inning"
    t.integer "opponent_second_inning"
    t.integer "opponent_third_inning"
    t.integer "opponent_fourth_inning"
    t.integer "opponent_fifth_inning"
    t.integer "opponent_sixth_inning"
    t.integer "opponent_seventh_inning"
    t.integer "opponent_eigth_inning"
    t.integer "opponent_ninth_inning"
    t.integer "season_id"
  end

  create_table "games_players", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

  create_table "players", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "number"
    t.string  "primary_position"
    t.string  "secondary_position"
    t.string  "position_description"
    t.string  "bats"
    t.string  "throws"
    t.string  "photo"
    t.text    "description"
    t.string  "height"
    t.integer "weight"
    t.date    "birthday"
  end

  create_table "players_seasons", force: true do |t|
    t.integer "player_id"
    t.integer "season_id"
  end

  create_table "seasons", force: true do |t|
    t.integer "year"
    t.integer "wins"
    t.integer "losses"
    t.integer "runs_scored"
    t.integer "runs_allowed"
    t.text    "description"
  end

  create_table "statistics", force: true do |t|
    t.boolean "played"
    t.integer "at_bats"
    t.integer "runs"
    t.integer "hits"
    t.integer "doubles"
    t.integer "triples"
    t.integer "homers"
    t.integer "rbis"
    t.integer "walks"
    t.integer "hit_by_pitch"
    t.integer "strikeouts"
    t.integer "sac_fly"
    t.integer "player_id"
    t.integer "game_id"
    t.integer "season_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
