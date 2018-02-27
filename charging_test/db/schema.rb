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

ActiveRecord::Schema.define(version: 20180226153120) do

  create_table "credit_card_charges", force: :cascade do |t|
    t.boolean  "paid",                    default: false
    t.integer  "amount",      limit: 4,   default: 0
    t.string   "currency",    limit: 255, default: "usd"
    t.boolean  "refunded",                default: false
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "credit_card_charges", ["customer_id"], name: "index_credit_card_charges_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "credit_card_charges", "customers"
end
