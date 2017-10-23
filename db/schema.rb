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

ActiveRecord::Schema.define(version: 20170825053352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_times", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.integer  "corrective"
    t.integer  "functional"
    t.integer  "incidents"
    t.integer  "other"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "modifications", force: :cascade do |t|
    t.string   "short_description"
    t.text     "long_description"
    t.integer  "analyst_id"
    t.integer  "analyse_reviewer_id"
    t.integer  "programmer_id"
    t.integer  "code_reviewer_id"
    t.integer  "tester_id"
    t.integer  "documenter_id"
    t.integer  "final_reviewer_id"
    t.integer  "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sprint_assignments", force: :cascade do |t|
    t.integer  "sprint_id"
    t.integer  "modification_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.string   "name"
    t.text     "long_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "short_name"
    t.string   "surname"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
