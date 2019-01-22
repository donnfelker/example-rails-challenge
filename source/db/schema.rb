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

ActiveRecord::Schema.define(version: 20190122140047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: true do |t|
    t.integer "created",                     null: false
    t.boolean "paid",        default: false
    t.decimal "amount",                      null: false
    t.string  "currency",                    null: false
    t.boolean "refunded",    default: false
    t.integer "customer_id",                 null: false
  end

  create_table "customers", force: true do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
