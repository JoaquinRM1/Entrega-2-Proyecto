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

ActiveRecord::Schema[7.1].define(version: 2024_05_03_025451) do
  create_table "board_tasks", force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_tasks_on_board_id"
    t.index ["task_id"], name: "index_board_tasks_on_task_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "board_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.integer "board_id"
    t.string "state_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_states_on_board_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "board_id"
    t.integer "state_id"
    t.string "title"
    t.text "description"
    t.integer "informer_id"
    t.integer "assignee_id"
    t.integer "user_id"
    t.string "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["board_id"], name: "index_tasks_on_board_id"
    t.index ["informer_id"], name: "index_tasks_on_informer_id"
    t.index ["state_id"], name: "index_tasks_on_state_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.integer "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "board_tasks", "boards"
  add_foreign_key "board_tasks", "tasks"
  add_foreign_key "states", "boards"
  add_foreign_key "tasks", "boards"
  add_foreign_key "tasks", "states"
  add_foreign_key "tasks", "users"
  add_foreign_key "tasks", "users", column: "assignee_id"
  add_foreign_key "tasks", "users", column: "informer_id"
end
