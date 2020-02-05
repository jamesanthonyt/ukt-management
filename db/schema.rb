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

ActiveRecord::Schema.define(version: 2020_01_24_160600) do

  create_table "af_venue_mappings", force: :cascade do |t|
    t.string "af_venue_id"
    t.integer "performance_space_id"
    t.integer "source_org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["af_venue_id"], name: "index_af_venue_mappings_on_af_venue_id"
    t.index ["performance_space_id"], name: "index_af_venue_mappings_on_performance_space_id"
    t.index ["source_org_id"], name: "index_af_venue_mappings_on_source_org_id"
  end

  create_table "af_venues", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "source_org_id"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_org_id"], name: "index_af_venues_on_source_org_id"
  end

  create_table "performance_spaces", force: :cascade do |t|
    t.string "name"
    t.integer "theatre_id"
    t.string "space_type"
    t.integer "capacity"
    t.string "programme"
    t.string "grouping"
    t.boolean "include", default: true
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theatre_id"], name: "index_performance_spaces_on_theatre_id"
  end

  create_table "source_orgs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.string "management"
    t.integer "source_org_id"
    t.boolean "include", default: true
    t.string "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_org_id"], name: "index_theatres_on_source_org_id"
  end

end
