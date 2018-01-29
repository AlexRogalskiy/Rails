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

ActiveRecord::Schema.define(version: 20180129154646) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "order", default: 0
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "address", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "discount", precision: 8, scale: 2, default: "1.0"
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_line_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "discount", precision: 8, scale: 2, default: "1.0"
    t.string "coupon_code"
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_line_items_on_order_id"
    t.index ["product_id"], name: "index_order_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "email"
    t.string "order_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comments"
    t.integer "payment_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "pay_type", null: false
    t.string "pay_status", null: false
    t.datetime "payed_at"
    t.string "pay_code", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 8, scale: 2, default: "1.0"
    t.integer "category_id"
    t.integer "limit", default: 0
    t.integer "vote", default: 0
    t.index ["category_id"], name: "index_products_on_category_id"
  end

end
