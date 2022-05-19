# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_13_130133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "status"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_bags_on_game_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "game_id", null: false
    t.datetime "start_time"
    t.integer "nb_players"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_bookings_on_contact_id"
    t.index ["game_id"], name: "index_bookings_on_game_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "players_min"
    t.integer "duration"
    t.boolean "simultaneous_start"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "bag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bag_id"], name: "index_matches_on_bag_id"
    t.index ["booking_id"], name: "index_matches_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bags", "games"
  add_foreign_key "bookings", "contacts"
  add_foreign_key "bookings", "games"
  add_foreign_key "matches", "bags"
  add_foreign_key "matches", "bookings"
end
