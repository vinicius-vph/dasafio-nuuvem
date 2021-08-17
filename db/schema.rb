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

ActiveRecord::Schema.define(version: 2021_07_15_194533) do

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "item_price"
    t.integer "purchase_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchaser_id", null: false
    t.integer "merchant_id", null: false
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
    t.index ["purchaser_id"], name: "index_transactions_on_purchaser_id"
  end

  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "merchants"
  add_foreign_key "transactions", "purchasers"
end
