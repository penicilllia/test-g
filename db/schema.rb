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

ActiveRecord::Schema.define(version: 2022_08_04_101433) do

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "correct", default: false
    t.integer "answers_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answers_id"], name: "index_answers_on_answers_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gists", force: :cascade do |t|
    t.string "url"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.integer "questions_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questions_id"], name: "index_questions_on_questions_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.integer "current_question_id"
    t.integer "correct_questions", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_question_id"], name: "index_test_passages_on_current_question_id"
    t.index ["test_id"], name: "index_test_passages_on_test_id"
    t.index ["user_id"], name: "index_test_passages_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 1
    t.integer "tests_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["tests_id"], name: "index_tests_on_tests_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type"], name: "index_users_on_type"
  end

end
