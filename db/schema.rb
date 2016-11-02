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

ActiveRecord::Schema.define(version: 20161102122433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name",        null: false
    t.string   "icon"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "laundries", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "description",                          null: false
    t.string   "logo"
    t.string   "background_image"
    t.string   "category",                             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "city_id"
    t.integer  "minimum_order_price"
    t.integer  "minimum_collection_time"
    t.integer  "order_processing_time"
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["city_id"], name: "index_laundries_on_city_id", using: :btree
    t.index ["confirmation_token"], name: "index_laundries_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_laundries_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_laundries_on_reset_password_token", unique: true, using: :btree
  end

  create_table "laundry_treatments", force: :cascade do |t|
    t.integer  "laundry_id"
    t.integer  "treatment_id"
    t.integer  "price",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["laundry_id"], name: "index_laundry_treatments_on_laundry_id", using: :btree
    t.index ["treatment_id"], name: "index_laundry_treatments_on_treatment_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "laundry_id"
    t.integer  "status",           default: 0
    t.boolean  "paid",             default: false
    t.string   "street_name"
    t.string   "house_number"
    t.string   "apartment_number"
    t.string   "contact_number"
    t.text     "notes"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "email"
    t.index ["laundry_id"], name: "index_orders_on_laundry_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "amount",                      null: false
    t.boolean  "paid",        default: false
    t.string   "payment_url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "laundry_id"
    t.integer  "value",                      null: false
    t.text     "content"
    t.boolean  "verified",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["laundry_id"], name: "index_ratings_on_laundry_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "treatments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["item_id"], name: "index_treatments_on_item_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "phone_number",     null: false
    t.string   "email"
    t.date     "birthdate"
    t.string   "api_token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "city_id"
    t.string   "street_name"
    t.string   "house_number"
    t.string   "apartment_number"
    t.text     "notes"
    t.string   "contact_number"
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
  end

  create_table "verification_tokens", force: :cascade do |t|
    t.string   "token",                        null: false
    t.string   "phone_number",                 null: false
    t.string   "code",                         null: false
    t.boolean  "verified",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["token"], name: "index_verification_tokens_on_token", unique: true, using: :btree
  end

  add_foreign_key "items", "categories"
  add_foreign_key "laundry_treatments", "laundries"
  add_foreign_key "laundry_treatments", "treatments"
  add_foreign_key "orders", "laundries"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "ratings", "laundries"
  add_foreign_key "ratings", "users"
  add_foreign_key "treatments", "items"
end
