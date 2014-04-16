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

ActiveRecord::Schema.define(version: 20140416050834) do

  create_table "swim_records", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "swimmer_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer  "check_in_user_id"
    t.integer  "check_out_user_id"
    t.string   "phone_number"
    t.boolean  "completed",            default: false
    t.string   "check_in_first_name"
    t.string   "check_in_last_name"
    t.string   "check_out_first_name"
    t.string   "check_out_last_name"
  end

  create_table "swimmers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "usms_number"
    t.string   "lmsc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_initial"
    t.string   "phone_number"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.boolean  "admin",                  default: false
    t.string   "time_zone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
