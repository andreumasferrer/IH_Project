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

ActiveRecord::Schema.define(version: 20150803162443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plan_dates", force: :cascade do |t|
    t.datetime "start_date",                 null: false
    t.datetime "end_date"
    t.boolean  "all_day",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "plan_id"
  end

  create_table "plan_locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "plan_id"
  end

  create_table "plan_subscription_ok_dates", force: :cascade do |t|
    t.integer  "order",                null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "plan_subscription_id"
    t.integer  "plan_date_id"
  end

  create_table "plan_subscriptions", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "plan_subscriptions", ["plan_id", "user_id"], name: "index_plan_subscriptions_on_plan_id_and_user_id", unique: true, using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "short_desc"
    t.text     "long_desc"
    t.string   "image_url"
    t.boolean  "open_dates",     default: false, null: false
    t.boolean  "open_locations", default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "status",                         null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_url"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
