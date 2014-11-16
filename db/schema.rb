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

ActiveRecord::Schema.define(version: 20141112145150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocations", force: true do |t|
    t.integer  "user_id",             null: false
    t.integer  "staffing_request_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "allocations", ["staffing_request_id"], name: "index_allocations_on_staffing_request_id", using: :btree
  add_index "allocations", ["user_id"], name: "index_allocations_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_staffing_requests", force: true do |t|
    t.integer "skill_id",            null: false
    t.integer "staffing_request_id", null: false
  end

  create_table "skills_users", force: true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "staffing_requests", force: true do |t|
    t.integer  "percentage"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "status",     default: 0, null: false
    t.integer  "title_id"
    t.integer  "project_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "staffing_requests", ["project_id"], name: "index_staffing_requests_on_project_id", using: :btree
  add_index "staffing_requests", ["title_id"], name: "index_staffing_requests_on_title_id", using: :btree

  create_table "titles", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.integer  "role",       default: 1, null: false
    t.integer  "title_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["title_id"], name: "index_users_on_title_id", using: :btree

end
