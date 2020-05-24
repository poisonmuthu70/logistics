# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_11_164754) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "minimum_price"
    t.datetime "auction_end"
    t.string "status"
    t.integer "address_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_auctions_on_address_id"
    t.index ["user_id"], name: "index_auctions_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.float "price"
    t.integer "user_id"
    t.integer "auction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_bids_on_auction_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "customer_infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.boolean "status", default: false
    t.boolean "is_verify", default: false
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vechile_no"
    t.string "vechile_type"
    t.string "meterial"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.datetime "delivery_start"
    t.datetime "delivery_end"
    t.string "status"
    t.integer "users_id"
    t.integer "address_id"
    t.integer "auction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_deliveries_on_address_id"
    t.index ["auction_id"], name: "index_deliveries_on_auction_id"
    t.index ["users_id"], name: "index_deliveries_on_users_id"
  end

  create_table "driver_infos", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "occupation"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.boolean "status", default: true
    t.boolean "is_verify", default: false
    t.boolean "is_available", default: true
    t.string "vechile_no"
    t.string "vechile_type"
    t.string "profile_path"
    t.integer "delivery_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "newdeliveries", force: :cascade do |t|
    t.string "delivery_id"
    t.string "source"
    t.string "destination"
    t.string "type"
    t.string "booked_by"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.integer "phone_no"
    t.string "delivery_address"
    t.integer "contact_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "occupation"
    t.string "phone_number"
    t.boolean "is_driver", default: false
    t.boolean "is_customer", default: false
    t.boolean "is_guest", default: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.boolean "status", default: false
    t.boolean "is_verify", default: false
    t.boolean "is_available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "auctions", "addresses"
  add_foreign_key "auctions", "users"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "users"
  add_foreign_key "deliveries", "addresses"
  add_foreign_key "deliveries", "auctions"
  add_foreign_key "deliveries", "users", column: "users_id"
end
