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

ActiveRecord::Schema.define(version: 20141208073333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: true do |t|
    t.integer  "training_session_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["client_id"], name: "index_attendances_on_client_id", using: :btree
  add_index "attendances", ["training_session_id", "client_id"], name: "index_attendances_on_training_session_id_and_client_id", unique: true, using: :btree
  add_index "attendances", ["training_session_id"], name: "index_attendances_on_training_session_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "email"
    t.string   "gender"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "registered_on"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercises", ["name"], name: "index_exercises_on_name", unique: true, using: :btree

  create_table "invoices", force: true do |t|
    t.date     "issues_on"
    t.float    "amount"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "measurements", force: true do |t|
    t.integer  "attendance_id"
    t.integer  "measure_id"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height"
    t.float    "weight"
    t.integer  "waist"
    t.integer  "hip"
    t.integer  "bicep"
    t.integer  "thigh"
    t.integer  "chest"
  end

  add_index "measurements", ["attendance_id", "measure_id"], name: "index_measurements_on_attendance_id_and_measure_id", unique: true, using: :btree
  add_index "measurements", ["attendance_id"], name: "index_measurements_on_attendance_id", using: :btree
  add_index "measurements", ["measure_id"], name: "index_measurements_on_measure_id", using: :btree

  create_table "measures", force: true do |t|
    t.string   "name"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measures", ["name"], name: "index_measures_on_name", unique: true, using: :btree
  add_index "measures", ["unit_id"], name: "index_measures_on_unit_id", using: :btree

  create_table "payments", force: true do |t|
    t.float    "amount"
    t.date     "paid_on"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["client_id"], name: "index_payments_on_client_id", using: :btree

  create_table "performances", force: true do |t|
    t.integer  "attendance_id"
    t.integer  "planned_workout_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performances", ["attendance_id"], name: "index_performances_on_attendance_id", using: :btree
  add_index "performances", ["planned_workout_id"], name: "index_performances_on_planned_workout_id", using: :btree

  create_table "planned_workouts", force: true do |t|
    t.integer  "workout_id"
    t.integer  "training_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "planned_workouts", ["training_session_id"], name: "index_planned_workouts_on_training_session_id", using: :btree
  add_index "planned_workouts", ["workout_id"], name: "index_planned_workouts_on_workout_id", using: :btree

  create_table "supersets", force: true do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.integer  "unit_id"
    t.integer  "amount"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supersets", ["exercise_id"], name: "index_supersets_on_exercise_id", using: :btree
  add_index "supersets", ["unit_id"], name: "index_supersets_on_unit_id", using: :btree
  add_index "supersets", ["workout_id"], name: "index_supersets_on_workout_id", using: :btree

  create_table "tariffs", force: true do |t|
    t.date     "starts_on"
    t.date     "expires_on"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_sessions", force: true do |t|
    t.datetime "starts_at"
    t.string   "location"
    t.integer  "minutes",    default: 60
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
  end

  create_table "units", force: true do |t|
    t.string   "acronym"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["acronym"], name: "index_units_on_acronym", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workouts", force: true do |t|
    t.string   "name"
    t.integer  "unit_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workouts", ["name"], name: "index_workouts_on_name", unique: true, using: :btree
  add_index "workouts", ["unit_id"], name: "index_workouts_on_unit_id", using: :btree

end
