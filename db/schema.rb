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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_110244) do
  create_table "batches", force: :cascade do |t|
    t.time "from"
    t.time "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coachings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "beginning"
    t.date "end"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sport_batch_branch_id", null: false
    t.index ["sport_batch_branch_id"], name: "index_coachings_on_sport_batch_branch_id"
    t.index ["user_id"], name: "index_coachings_on_user_id"
  end

  create_table "sport_batch_branches", force: :cascade do |t|
    t.integer "sport_batch_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_sport_batch_branches_on_branch_id"
    t.index ["sport_batch_id"], name: "index_sport_batch_branches_on_sport_batch_id"
  end

  create_table "sport_batches", force: :cascade do |t|
    t.integer "sport_id", null: false
    t.integer "batch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_sport_batches_on_batch_id"
    t.index ["sport_id"], name: "index_sport_batches_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "coachings", "sport_batch_branches"
  add_foreign_key "coachings", "users"
  add_foreign_key "sport_batch_branches", "branches"
  add_foreign_key "sport_batch_branches", "sport_batches"
  add_foreign_key "sport_batches", "batches"
  add_foreign_key "sport_batches", "sports"
end
