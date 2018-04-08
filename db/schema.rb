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

ActiveRecord::Schema.define(version: 20180408032219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.bigint "truck_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_cargos_on_delivery_id"
    t.index ["truck_id"], name: "index_cargos_on_truck_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "picking_time_id"
    t.bigint "load_time_id"
    t.bigint "transportation_time_id"
    t.bigint "receive_time_id"
    t.bigint "storage_time_id"
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_time_id"], name: "index_deliveries_on_load_time_id"
    t.index ["picking_time_id"], name: "index_deliveries_on_picking_time_id"
    t.index ["receive_time_id"], name: "index_deliveries_on_receive_time_id"
    t.index ["storage_time_id"], name: "index_deliveries_on_storage_time_id"
    t.index ["transportation_time_id"], name: "index_deliveries_on_transportation_time_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "load_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "load_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
  end

  create_table "picking_times", force: :cascade do |t|
    t.integer "duration_time"
    t.time "start_time"
    t.integer "number_of_items"
    t.integer "number_of_items_type"
    t.datetime "picking_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receive_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "received_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
  end

  create_table "storage_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "storage_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
  end

  create_table "transportation_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "transportation_date"
    t.bigint "origin_city_id"
    t.bigint "destination_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_city_id"], name: "index_transportation_times_on_destination_city_id"
    t.index ["origin_city_id"], name: "index_transportation_times_on_origin_city_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.bigint "driver_id"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_trucks_on_driver_id"
  end

  add_foreign_key "cargos", "deliveries"
  add_foreign_key "cargos", "trucks"
  add_foreign_key "deliveries", "load_times"
  add_foreign_key "deliveries", "picking_times"
  add_foreign_key "deliveries", "receive_times"
  add_foreign_key "deliveries", "storage_times"
  add_foreign_key "deliveries", "transportation_times"
  add_foreign_key "transportation_times", "cities", column: "destination_city_id"
  add_foreign_key "transportation_times", "cities", column: "origin_city_id"
  add_foreign_key "trucks", "drivers"
end
