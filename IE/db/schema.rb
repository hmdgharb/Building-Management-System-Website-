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

ActiveRecord::Schema.define(version: 20140624233201) do

  create_table "bills", force: true do |t|
    t.string   "monthlybill_id"
    t.string   "billType"
    t.string   "name"
    t.integer  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["monthlybill_id"], name: "index_bills_on_monthlybill_id"

  create_table "charges", force: true do |t|
    t.string   "buildingNum_id"
    t.string   "usr_id"
    t.string   "monthlybill_id"
    t.string   "chargeMonth"
    t.string   "chargeYear"
    t.string   "amount"
    t.string   "chargeDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "buildingNum_id"
    t.string   "usr_id"
    t.string   "usr_firstN"
    t.string   "message"
    t.integer  "likePoint"
    t.integer  "dislikePoint"
    t.string   "commentType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthlybills", force: true do |t|
    t.string   "usr_id"
    t.string   "usr_buildingNum"
    t.string   "month"
    t.string   "year"
    t.string   "totalInnerBills"
    t.string   "totalAmount"
    t.string   "totalCash"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthlybills", ["usr_id"], name: "index_monthlybills_on_usr_id"

  create_table "msgs", force: true do |t|
    t.string   "subject"
    t.string   "sender_id"
    t.string   "sender_buildingNum"
    t.string   "sender_email"
    t.string   "recipient_id"
    t.string   "recipient_buildingNum"
    t.string   "recipient_email"
    t.string   "body"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "commentid"
    t.string   "clicker_id"
    t.string   "buildingNum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipts", force: true do |t|
    t.string   "monthlybill_id"
    t.string   "buildingNum_id"
    t.string   "usr_id"
    t.string   "Month"
    t.string   "Year"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usrs", force: true do |t|
    t.string   "usageType"
    t.string   "firstN"
    t.string   "sureN"
    t.string   "telNum"
    t.string   "email"
    t.string   "password_digest"
    t.string   "buildingNum"
    t.integer  "cash"
    t.integer  "familyNum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
