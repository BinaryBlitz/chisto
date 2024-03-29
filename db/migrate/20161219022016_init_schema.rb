class InitSchema < ActiveRecord::Migration[5.0]
  def up

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
    end

    create_table "cities", force: :cascade do |t|
      t.string   "name",       null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.float    "latitude",   null: false
      t.float    "longitude",  null: false
    end

    create_table "items", force: :cascade do |t|
      t.integer  "category_id"
      t.string   "name",                        null: false
      t.string   "icon"
      t.text     "description"
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
      t.boolean  "use_area",    default: false
      t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    end

    create_table "laundries", force: :cascade do |t|
      t.string   "name",                                    null: false
      t.string   "description",                             null: false
      t.string   "logo"
      t.string   "background_image"
      t.datetime "created_at",                              null: false
      t.datetime "updated_at",                              null: false
      t.integer  "city_id"
      t.integer  "minimum_order_price",     default: 0
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
      t.integer  "laundry_id"
      t.integer  "treatment_id"
      t.integer  "price",        null: false
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
      t.index ["laundry_id"], name: "index_laundry_treatments_on_laundry_id", using: :btree
      t.index ["treatment_id"], name: "index_laundry_treatments_on_treatment_id", using: :btree
    end

    create_table "line_items", force: :cascade do |t|
      t.integer  "order_id"
      t.integer  "laundry_treatment_id"
      t.integer  "quantity",             default: 1
      t.integer  "price",                                null: false
      t.datetime "created_at",                           null: false
      t.datetime "updated_at",                           null: false
      t.boolean  "has_decoration",       default: false
      t.integer  "treatment_id"
      t.float    "multiplier",           default: 1.0
      t.index ["laundry_treatment_id"], name: "index_line_items_on_laundry_treatment_id", using: :btree
      t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
      t.index ["treatment_id"], name: "index_line_items_on_treatment_id", using: :btree
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
      t.index ["laundry_id"], name: "index_orders_on_laundry_id", using: :btree
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

    create_table "treatments", force: :cascade do |t|
      t.integer  "item_id"
      t.string   "name",        null: false
      t.text     "description"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
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
    add_foreign_key "line_items", "orders"
    add_foreign_key "orders", "laundries"
    add_foreign_key "orders", "users"
    add_foreign_key "payments", "orders"
    add_foreign_key "ratings", "laundries"
    add_foreign_key "ratings", "users"
    add_foreign_key "schedules", "laundries"
    add_foreign_key "treatments", "items"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
