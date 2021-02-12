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

ActiveRecord::Schema.define(version: 2021_01_20_194651) do

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.float "import"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "service_id", null: false
    t.index ["service_id"], name: "index_items_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.datetime "time"
    t.string "employee"
    t.text "observation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vehicle_id", null: false
    t.index ["vehicle_id"], name: "index_services_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "patent"
    t.string "brand"
    t.string "model"
    t.string "fuel_fype"
    t.string "engine_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "items", "services"
  add_foreign_key "services", "vehicles"
end
