# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140718004828) do

  create_table "bookees", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "picture"
    t.datetime "arrest_datetime"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pcf_number"
    t.string   "city_state"
    t.string   "officer"
    t.string   "agency"
    t.float    "address_lat"
    t.float    "address_lon"
  end

  create_table "convict_offenses", force: true do |t|
    t.integer  "bookee_id"
    t.integer  "crime_id"
    t.string   "court"
    t.string   "required_bond"
    t.string   "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "convict_offenses", ["bookee_id"], name: "index_convict_offenses_on_bookee_id"
  add_index "convict_offenses", ["crime_id"], name: "index_convict_offenses_on_crime_id"

  create_table "crimes", force: true do |t|
    t.string   "name"
    t.string   "classification"
    t.string   "statute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jails", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
