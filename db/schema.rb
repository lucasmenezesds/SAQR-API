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

ActiveRecord::Schema.define(version: 2020_01_02_035245) do

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

  create_table "cities_distances_collections", force: :cascade do |t|
    t.jsonb "json_data", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "((json_data ->> 'destination_id'::text))", name: "cities_dist_coll_destination_id"
    t.index "((json_data ->> 'destination_name'::text))", name: "cities_dist_coll_destination_name"
    t.index "((json_data ->> 'distance_value'::text))", name: "cities_dist_coll_distance_value"
    t.index "((json_data ->> 'origin_id'::text))", name: "cities_dist_coll_origin_id"
    t.index "((json_data ->> 'origin_name'::text))", name: "cities_dist_coll_origin_name"
    t.index ["json_data"], name: "index_cities_distances_collections_on_json_data", using: :gin
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
    t.integer "total_duration"
    t.index ["load_time_id"], name: "index_deliveries_on_load_time_id"
    t.index ["picking_time_id"], name: "index_deliveries_on_picking_time_id"
    t.index ["receive_time_id"], name: "index_deliveries_on_receive_time_id"
    t.index ["storage_time_id"], name: "index_deliveries_on_storage_time_id"
    t.index ["transportation_time_id"], name: "index_deliveries_on_transportation_time_id"
  end

  create_table "distribution_methods", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distribution_methods_parameters", force: :cascade do |t|
    t.bigint "distribution_method_id"
    t.bigint "distribution_parameter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distribution_method_id"], name: "index_distribution_methods_parameters_on_distribution_method_id"
    t.index ["distribution_parameter_id"], name: "index_distribution_methods_parameters_on_distribution_param_id"
  end

  create_table "distribution_parameters", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.boolean "uppercase"
    t.string "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "start_time"
  end

  create_table "picking_times", force: :cascade do |t|
    t.integer "duration_time"
    t.datetime "start_time"
    t.integer "number_of_items"
    t.integer "number_of_items_type"
    t.datetime "picking_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "event", default: false
  end

  create_table "receive_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "received_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
  end

  create_table "simulate_deliveries", force: :cascade do |t|
    t.string "label"
    t.jsonb "simulation_data"
    t.jsonb "steps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "storage_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
  end

  create_table "transportation_times", force: :cascade do |t|
    t.integer "duration_time"
    t.boolean "event"
    t.datetime "transportation_date"
    t.bigint "origin_city_id"
    t.bigint "destination_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer "distance"
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
  add_foreign_key "distribution_methods_parameters", "distribution_methods"
  add_foreign_key "distribution_methods_parameters", "distribution_parameters"
  add_foreign_key "transportation_times", "cities", column: "destination_city_id"
  add_foreign_key "transportation_times", "cities", column: "origin_city_id"
  add_foreign_key "trucks", "drivers"
end
