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

ActiveRecord::Schema.define(version: 20170128141009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "description"
    t.string   "icon"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "color",                         null: false
    t.boolean  "featured",      default: false
    t.integer  "items_count",   default: 0
    t.string   "items_preview", default: [],                 array: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_cities_on_deleted_at", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name",                        null: false
    t.string   "icon"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "use_area",    default: false
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_items_on_deleted_at", using: :btree
  end

  create_table "laundries", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.string   "description",                             null: false
    t.string   "logo"
    t.string   "background_image"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "city_id"
    t.integer  "minimum_collection_time"
    t.integer  "order_processing_time"
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.float    "rating",                  default: 0.0
    t.integer  "ratings_count",           default: 0
    t.boolean  "enabled",                 default: false
    t.integer  "minimum_order_price",     default: 0
    t.integer  "free_delivery_from",      default: 0
    t.integer  "delivery_fee",            default: 0
    t.index ["city_id"], name: "index_laundries_on_city_id", using: :btree
    t.index ["confirmation_token"], name: "index_laundries_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_laundries_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_laundries_on_reset_password_token", unique: true, using: :btree
  end

  create_table "laundry_items", force: :cascade do |t|
    t.integer  "laundry_id"
    t.integer  "item_id"
    t.float    "decoration_multiplier", default: 1.0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["item_id"], name: "index_laundry_items_on_item_id", using: :btree
    t.index ["laundry_id"], name: "index_laundry_items_on_laundry_id", using: :btree
  end

  create_table "laundry_treatments", force: :cascade do |t|
    t.integer  "treatment_id"
    t.integer  "price",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "laundry_id"
    t.index ["laundry_id"], name: "index_laundry_treatments_on_laundry_id", using: :btree
    t.index ["treatment_id"], name: "index_laundry_treatments_on_treatment_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "laundry_item_id"
    t.integer  "quantity",                                 default: 1
    t.decimal  "area",            precision: 10, scale: 1
    t.boolean  "has_decoration",                           default: false
    t.float    "multiplier",                               default: 1.0
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["laundry_item_id"], name: "index_order_items_on_laundry_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_treatments", force: :cascade do |t|
    t.integer  "order_item_id"
    t.integer  "laundry_treatment_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "price",                null: false
    t.integer  "treatment_id"
    t.index ["laundry_treatment_id"], name: "index_order_treatments_on_laundry_treatment_id", using: :btree
    t.index ["order_item_id"], name: "index_order_treatments_on_order_item_id", using: :btree
    t.index ["treatment_id"], name: "index_order_treatments_on_treatment_id", using: :btree
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
    t.integer  "total_price",                      null: false
    t.integer  "delivery_fee",     default: 0
    t.datetime "collection_date"
    t.datetime "delivery_date"
    t.integer  "payment_method",   default: 0
    t.integer  "promo_code_id"
    t.index ["laundry_id"], name: "index_orders_on_laundry_id", using: :btree
    t.index ["promo_code_id"], name: "index_orders_on_promo_code_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "partner_applications", force: :cascade do |t|
    t.string   "representative_name", null: false
    t.string   "laundry_name",        null: false
    t.string   "city"
    t.string   "phone_number"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
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

  create_table "promo_codes", force: :cascade do |t|
    t.string   "code",                         null: false
    t.integer  "promotion_id"
    t.integer  "laundry_id"
    t.integer  "discount",                     null: false
    t.boolean  "reusable",     default: false
    t.boolean  "redeemed",     default: false
    t.datetime "valid_from"
    t.datetime "valid_until"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["laundry_id"], name: "index_promo_codes_on_laundry_id", using: :btree
    t.index ["promotion_id"], name: "index_promo_codes_on_promotion_id", using: :btree
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "description"
    t.integer  "laundry_id"
    t.integer  "promo_codes_count", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["laundry_id"], name: "index_promotions_on_laundry_id", using: :btree
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

  create_table "schedules", force: :cascade do |t|
    t.integer  "laundry_id"
    t.integer  "day_of_the_week", null: false
    t.time     "opens_at",        null: false
    t.time     "closes_at",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["laundry_id"], name: "index_schedules_on_laundry_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "state",      default: 0
    t.integer  "order_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["order_id"], name: "index_statuses_on_order_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "support_requests", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_treatments_on_deleted_at", using: :btree
    t.index ["item_id"], name: "index_treatments_on_item_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.string   "phone_number",                 null: false
    t.string   "email"
    t.date     "birthdate"
    t.string   "api_token"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "city_id"
    t.string   "street_name"
    t.string   "house_number"
    t.string   "apartment_number"
    t.text     "notes"
    t.string   "contact_number"
    t.integer  "orders_count",     default: 0
    t.string   "device_token"
    t.integer  "platform",         default: 0
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
  add_foreign_key "laundry_items", "items"
  add_foreign_key "laundry_items", "laundries"
  add_foreign_key "laundry_treatments", "laundries"
  add_foreign_key "laundry_treatments", "treatments"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_treatments", "order_items"
  add_foreign_key "order_treatments", "treatments"
  add_foreign_key "orders", "laundries"
  add_foreign_key "orders", "promo_codes"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "ratings", "laundries"
  add_foreign_key "ratings", "users"
  add_foreign_key "schedules", "laundries"
  add_foreign_key "statuses", "orders"
  add_foreign_key "treatments", "items"
end
