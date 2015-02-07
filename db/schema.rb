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

ActiveRecord::Schema.define(version: 20150207010046) do

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "unit_id"
    t.integer  "utility_charge_id"
    t.decimal  "total_paid",        precision: 6, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["unit_id"], name: "index_payments_on_unit_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"
  add_index "payments", ["utility_charge_id"], name: "index_payments_on_utility_charge_id"

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "description"
    t.decimal  "rent_charge",     precision: 6, scale: 2
    t.decimal  "security_charge", precision: 6, scale: 2
    t.boolean  "security_paid"
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["property_id"], name: "index_units_on_property_id"

  create_table "users", force: true do |t|
    t.string   "name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false, null: false
    t.string   "stripe_pub_key"
    t.string   "stripe_secret_key"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "utility_charges", force: true do |t|
    t.string   "utility_name"
    t.decimal  "utility_charge"
    t.string   "utility_charge_date"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "utility_charges", ["property_id"], name: "index_utility_charges_on_property_id"

end
