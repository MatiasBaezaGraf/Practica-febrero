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

ActiveRecord::Schema.define(version: 2021_02_03_184132) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer "quantity"
    t.float "unit_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "replacement_id", null: false
    t.integer "invoice_id", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["replacement_id"], name: "index_invoice_items_on_replacement_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "bill_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replacements", force: :cascade do |t|
    t.string "name"
    t.date "manufacture_date"
    t.integer "serial_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "brand_id", null: false
    t.index ["brand_id"], name: "index_replacements_on_brand_id"
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "replacements"
  add_foreign_key "replacements", "brands"
end
