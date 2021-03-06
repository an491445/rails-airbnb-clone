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

ActiveRecord::Schema.define(version: 20170331080857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrivals", force: :cascade do |t|
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "minivan_id"
    t.index ["minivan_id"], name: "index_arrivals_on_minivan_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "minivan_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "message"
    t.index ["minivan_id"], name: "index_bookings_on_minivan_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "departures", force: :cascade do |t|
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "minivan_id"
    t.index ["minivan_id"], name: "index_departures_on_minivan_id", using: :btree
  end

  create_table "minivans", force: :cascade do |t|
    t.integer  "model_year"
    t.string   "gearbox"
    t.string   "picture"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "available_seats"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.integer  "price"
    t.text     "tagline"
    t.integer  "capacity"
    t.index ["user_id"], name: "index_minivans_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.boolean "driver_license"
    t.integer "user_id"
    t.string  "facebook_picture_url"
    t.string  "title"
    t.text    "biography"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "booking_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "arrivals", "minivans"
  add_foreign_key "bookings", "minivans"
  add_foreign_key "bookings", "users"
  add_foreign_key "departures", "minivans"
  add_foreign_key "minivans", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
