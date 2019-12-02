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

ActiveRecord::Schema.define(version: 2019_12_02_115645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coach_specialties", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coach_specialties_on_coach_id"
    t.index ["specialty_id"], name: "index_coach_specialties_on_specialty_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "siret"
    t.string "phone_number"
    t.string "address"
    t.string "zip_code"
    t.integer "price"
    t.string "account_number"
    t.string "account_name"
    t.boolean "reviewed", default: false
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_coaches_on_city_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
