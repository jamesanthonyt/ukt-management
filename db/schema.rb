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

ActiveRecord::Schema.define(version: 2020_01_21_163740) do

  create_table "af_venue_lookups", force: :cascade do |t|
    t.integer "theatre_id"
    t.integer "performance_space_id"
    t.string "af_venue"
    t.integer "af_source_org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_space_id"], name: "index_af_venue_lookups_on_performance_space_id"
    t.index ["theatre_id"], name: "index_af_venue_lookups_on_theatre_id"
  end

  create_table "audience_finder_venues", force: :cascade do |t|
    t.integer "srcorgid"
    t.string "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_spaces", force: :cascade do |t|
    t.string "name"
    t.string "space_type"
    t.integer "capacity"
    t.string "programme"
    t.string "grouping"
    t.boolean "include", default: true
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "theatre_id"
    t.index ["theatre_id"], name: "index_performance_spaces_on_theatre_id"
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.string "managed_by"
    t.integer "af_source_org_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
