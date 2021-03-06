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

ActiveRecord::Schema.define(version: 2020_05_09_183820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "product"
    t.string "company"
    t.string "code"
    t.string "packing"
    t.integer "unit", default: 1
    t.decimal "sgst", precision: 4, scale: 2, default: "6.0", null: false
    t.decimal "cgst", precision: 4, scale: 2, default: "6.0", null: false
    t.decimal "igst", precision: 4, scale: 2, default: "0.0", null: false
    t.decimal "rate_margin", precision: 4, scale: 2, default: "0.0", null: false
    t.decimal "fixed_disc", precision: 4, scale: 2, default: "0.0", null: false
    t.string "category"
    t.integer "mrp_paise", default: 0, null: false
    t.integer "pur_paise", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_medicines_on_name", unique: true
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "medicine_id", null: false
    t.integer "unit", default: 1
    t.integer "price_each_paise", default: 0, null: false
    t.integer "price_paise", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "delivery_mode", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medicine_id"], name: "index_order_details_on_medicine_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "total_paise", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_details", "medicines"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "users"
end
