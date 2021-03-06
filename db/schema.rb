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

ActiveRecord::Schema.define(version: 2020_03_16_141546) do

  create_table "code_lists", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "url", null: false
    t.string "password_digest", null: false
    t.string "picture", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_code_lists_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_code_lists_on_user_id"
  end

  create_table "exchange_lists", force: :cascade do |t|
    t.string "token", null: false
    t.date "use_date"
    t.integer "user_id"
    t.integer "code_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_list_id"], name: "index_exchange_lists_on_code_list_id"
    t.index ["user_id", "code_list_id"], name: "index_exchange_lists_on_user_id_and_code_list_id"
    t.index ["user_id"], name: "index_exchange_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "name"
    t.string "image_url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
