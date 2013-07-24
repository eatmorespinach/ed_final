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

ActiveRecord::Schema.define(version: 20130724203002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lis_images", force: true do |t|
    t.string   "file"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lis_images", ["listing_id"], name: "index_lis_images_on_listing_id", using: :btree

  create_table "listings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.integer  "guests"
    t.string   "city"
    t.integer  "country_id"
    t.string   "stay_length"
    t.text     "in_exchange"
    t.integer  "user_id"
  end

  create_table "profiles", force: true do |t|
    t.text     "skills"
    t.text     "about"
    t.string   "hometown"
    t.string   "nationality"
    t.string   "current_city"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer "rating"
    t.text    "description"
    t.integer "listing_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

end
