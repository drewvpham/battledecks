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

ActiveRecord::Schema.define(version: 20160429184810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "player_1_id"
    t.integer  "player_1_deck_id"
    t.integer  "player_2_id"
    t.integer  "player_2_deck_id"
    t.integer  "winner_id"
    t.integer  "round"
    t.integer  "tournament_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "player_1_presentation_url"
    t.string   "player_2_presentation_url"
  end

  add_index "matches", ["round"], name: "index_matches_on_round", using: :btree
  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  add_index "matches", ["winner_id"], name: "index_matches_on_winner_id", using: :btree

  create_table "tournament_players", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tournament_players", ["player_id"], name: "index_tournament_players_on_player_id", using: :btree
  add_index "tournament_players", ["tournament_id", "player_id"], name: "index_tournament_players_on_tournament_id_and_player_id", unique: true, using: :btree
  add_index "tournament_players", ["tournament_id"], name: "index_tournament_players_on_tournament_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "commissioner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tournaments", ["commissioner_id"], name: "index_tournaments_on_commissioner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "voter_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["match_id", "voter_id"], name: "index_votes_on_match_id_and_voter_id", unique: true, using: :btree
  add_index "votes", ["match_id"], name: "index_votes_on_match_id", using: :btree
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id", using: :btree

end
