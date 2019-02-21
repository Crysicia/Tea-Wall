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

ActiveRecord::Schema.define(version: 2019_02_19_173137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string "title"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_session_skills", force: :cascade do |t|
    t.bigint "work_session_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_work_session_skills_on_skill_id"
    t.index ["work_session_id"], name: "index_work_session_skills_on_work_session_id"
  end

  create_table "work_session_students", force: :cascade do |t|
    t.bigint "work_session_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_work_session_students_on_student_id"
    t.index ["work_session_id"], name: "index_work_session_students_on_work_session_id"
  end

  create_table "work_session_teachers", force: :cascade do |t|
    t.bigint "work_session_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_work_session_teachers_on_teacher_id"
    t.index ["work_session_id"], name: "index_work_session_teachers_on_work_session_id"
  end

  create_table "work_sessions", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.bigint "slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slot_id"], name: "index_work_sessions_on_slot_id"
  end

  add_foreign_key "work_session_skills", "skills"
  add_foreign_key "work_session_skills", "work_sessions"
  add_foreign_key "work_session_students", "students"
  add_foreign_key "work_session_students", "work_sessions"
  add_foreign_key "work_session_teachers", "teachers"
  add_foreign_key "work_session_teachers", "work_sessions"
  add_foreign_key "work_sessions", "slots"
end
