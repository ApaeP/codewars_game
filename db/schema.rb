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

ActiveRecord::Schema.define(version: 2021_06_03_222642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "requester_id"
    t.bigint "recipient_id"
    t.integer "status", default: 0
    t.index ["recipient_id"], name: "index_friendships_on_recipient_id"
    t.index ["requester_id"], name: "index_friendships_on_requester_id"
  end

  create_table "kata", force: :cascade do |t|
    t.string "codewars_id"
    t.string "url"
    t.string "title"
    t.integer "level"
    t.string "level_name"
    t.string "level_color"
    t.text "tags", default: [], array: true
    t.string "category"
    t.datetime "creation_date"
    t.text "languages", default: [], array: true
    t.integer "vote_score"
    t.integer "total_stars"
    t.text "description"
    t.integer "total_attempts"
    t.integer "total_completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revealed_solutions", force: :cascade do |t|
    t.bigint "solution_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["solution_id"], name: "index_revealed_solutions_on_solution_id"
    t.index ["user_id"], name: "index_revealed_solutions_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "kata_id", null: false
    t.text "content"
    t.text "language"
    t.string "codewars_id"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kata_id"], name: "index_solutions_on_kata_id"
    t.index ["user_id"], name: "index_solutions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "codewars_api_token"
    t.string "codewars_nickname"
    t.string "codewars_email"
    t.string "codewars_password"
    t.integer "honor"
    t.string "clan"
    t.integer "leaderboard_position"
    t.string "first_name"
    t.string "last_name"
    t.integer "overall_rank"
    t.string "overall_rank_name"
    t.string "overall_rank_color"
    t.integer "overall_score"
    t.jsonb "language_ranks"
    t.integer "katas_authored_count"
    t.integer "katas_completed_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users", column: "recipient_id"
  add_foreign_key "friendships", "users", column: "requester_id"
  add_foreign_key "revealed_solutions", "solutions"
  add_foreign_key "revealed_solutions", "users"
  add_foreign_key "solutions", "kata", column: "kata_id"
  add_foreign_key "solutions", "users"
end
