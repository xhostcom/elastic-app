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

ActiveRecord::Schema[7.0].define(version: 2023_01_30_212705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "sku", default: "", null: false
    t.string "title", default: "", null: false
    t.string "nickname", default: "", null: false
    t.float "price", default: 0.0, null: false
    t.integer "inventory", default: 0, null: false
    t.float "fulfillment_fee", default: 0.0, null: false
    t.float "unit_cost", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "purchase_order_id", null: false
    t.string "currency", default: "", null: false
    t.integer "quantity_ordered", default: 0, null: false
    t.integer "quantity_shipped", default: 0, null: false
    t.float "price", default: 0.0, null: false
    t.float "discount", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "item_id", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "order_num", limit: 20, default: "", null: false
    t.date "purchase_date"
    t.string "status", default: "", null: false
    t.string "sales_channel", default: "", null: false
    t.float "order_total", default: 0.0, null: false
    t.integer "num_items_shipped", default: 0, null: false
    t.integer "num_items_unshipped", default: 0, null: false
    t.string "payment_method", default: "", null: false
    t.date "shipped_at"
    t.float "shipping_price", default: 0.0, null: false
    t.float "shipping_tax", default: 0.0, null: false
    t.string "carrier", default: "", null: false
    t.string "tracking_number", default: "", null: false
    t.date "est_arrival_date"
    t.string "fulfillment_center", default: "", null: false
    t.date "confirmed_at"
    t.date "returned_date"
    t.string "return_reason", default: "", null: false
    t.text "notes", default: "", null: false
    t.date "refunded_at"
    t.string "ship_to_name", default: "", null: false
    t.string "ship_to_address", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmed_at"], name: "index_purchase_orders_on_confirmed_at"
    t.index ["est_arrival_date"], name: "index_purchase_orders_on_est_arrival_date"
    t.index ["order_num"], name: "index_purchase_orders_on_order_num"
    t.index ["purchase_date"], name: "index_purchase_orders_on_purchase_date"
    t.index ["refunded_at"], name: "index_purchase_orders_on_refunded_at"
    t.index ["returned_date"], name: "index_purchase_orders_on_returned_date"
    t.index ["sales_channel"], name: "index_purchase_orders_on_sales_channel"
    t.index ["shipped_at"], name: "index_purchase_orders_on_shipped_at"
    t.index ["status"], name: "index_purchase_orders_on_status"
  end

  create_table "services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "purchase_orders"
  add_foreign_key "services", "users"
end
