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

ActiveRecord::Schema[7.0].define(version: 2025_02_18_225007) do
  create_table "inflow_sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_inflow_sources", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "inflow_source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inflow_source_id"], name: "index_order_inflow_sources_on_inflow_source_id"
    t.index ["order_id"], name: "index_order_inflow_sources_on_order_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "telephone", null: false
    t.string "delivery_address", null: false
    t.integer "payment_method_id"
    t.string "other_comment", limit: 1000, default: "", null: false
    t.boolean "direct_mail_enabled", null: false
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_inflow_sources", "inflow_sources", on_update: :restrict, on_delete: :restrict
  add_foreign_key "order_inflow_sources", "orders", on_delete: :cascade
  add_foreign_key "order_products", "orders", on_update: :cascade, on_delete: :cascade
  add_foreign_key "order_products", "products", on_update: :restrict, on_delete: :restrict
  add_foreign_key "orders", "payment_methods", on_update: :restrict, on_delete: :restrict
end
