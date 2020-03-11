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

ActiveRecord::Schema.define(version: 2020_03_11_141741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "granny_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["granny_id"], name: "index_bookings_on_granny_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "grannies", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.date "birth_date", null: false
    t.bigint "user_id"
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grannies_on_user_id"
  end

  create_table "granny_passions", force: :cascade do |t|
    t.bigint "granny_id", null: false
    t.bigint "passion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["granny_id"], name: "index_granny_passions_on_granny_id"
    t.index ["passion_id"], name: "index_granny_passions_on_passion_id"
  end

  create_table "passions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "grannies"
  add_foreign_key "bookings", "users"
  add_foreign_key "grannies", "users"
  add_foreign_key "granny_passions", "grannies"
  add_foreign_key "granny_passions", "passions"
end
