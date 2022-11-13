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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_190258) do
  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.integer "coachings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coachings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sport_id", null: false
    t.integer "branch_id", null: false
    t.time "batch_from"
    t.time "batch_to"
    t.date "beginning"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_coachings_on_branch_id"
    t.index ["sport_id"], name: "index_coachings_on_sport_id"
    t.index ["user_id"], name: "index_coachings_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.integer "coachings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "coachings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coachings", "branches"
  add_foreign_key "coachings", "sports"
  add_foreign_key "coachings", "users"
end
