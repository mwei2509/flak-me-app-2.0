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

ActiveRecord::Schema.define(version: 20170311062925) do

  create_table "events", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "event_start"
    t.datetime "event_end"
    t.text     "description"
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "active",                 default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "private",                default: false
    t.string   "group_img_file_name"
    t.string   "group_img_content_type"
    t.integer  "group_img_file_size"
    t.datetime "group_img_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_name"
    t.text     "bio"
    t.string   "full_name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string  "role_type"
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["user_id"], name: "index_rsvps_on_user_id"
  end

  create_table "slides", force: :cascade do |t|
    t.integer  "slider"
    t.integer  "slidee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
