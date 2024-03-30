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

ActiveRecord::Schema[7.1].define(version: 2024_03_29_195537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "lat"
    t.string "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pollution_data", force: :cascade do |t|
    t.integer "aqi"
    t.float "pm2_5"
    t.float "pm10"
    t.float "no2"
    t.float "co"
    t.float "so2"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "no"
    t.float "o3"
    t.float "nh3"
    t.datetime "recorded_at"
    t.index ["location_id"], name: "index_pollution_data_on_location_id"
  end

  add_foreign_key "pollution_data", "locations"
end
