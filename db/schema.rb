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

ActiveRecord::Schema.define(version: 20150929123859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer  "internal_id"
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "event_id"
  end

  add_index "attachments", ["event_id"], name: "index_attachments_on_event_id", using: :btree

  create_table "attendees", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "attendees", ["event_id"], name: "index_attendees_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "scheduled"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_id"
  end

  add_index "events", ["position_id"], name: "index_events_on_position_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "holders", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "manages", ["holder_id"], name: "index_manages_on_holder_id", using: :btree
  add_index "manages", ["user_id"], name: "index_manages_on_user_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree
  add_index "participants", ["position_id"], name: "index_participants_on_position_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.datetime "from"
    t.datetime "to"
    t.integer  "area_id"
    t.integer  "holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["area_id"], name: "index_positions_on_area_id", using: :btree
  add_index "positions", ["holder_id"], name: "index_positions_on_holder_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attachments", "events"
  add_foreign_key "attendees", "events"
  add_foreign_key "events", "positions"
  add_foreign_key "events", "users"
  add_foreign_key "manages", "holders"
  add_foreign_key "manages", "users"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "positions"
  add_foreign_key "positions", "areas"
  add_foreign_key "positions", "holders"
end