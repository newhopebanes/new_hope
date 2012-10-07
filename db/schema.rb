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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121007203151) do

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "days", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "organisation",       :null => false
    t.string   "description"
    t.string   "contact_person"
    t.string   "contact_role"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "website"
    t.integer  "contact_id"
    t.date     "date"
    t.time     "time"
    t.boolean  "ongoing"
    t.integer  "frequency_id"
    t.integer  "day_id"
    t.string   "cost",               :null => false
    t.boolean  "access",             :null => false
    t.string   "access_details"
    t.integer  "referral_id",        :null => false
    t.string   "joining_process"
    t.string   "target_id",          :null => false
    t.string   "tag_id"
    t.string   "directions_car"
    t.string   "directions_walking"
    t.string   "directions_bus"
    t.string   "directions_train"
    t.string   "other"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "frequencies", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.string   "date"
    t.string   "time"
    t.string   "venue"
    t.string   "joining"
    t.string   "contact"
    t.string   "cost"
    t.string   "access"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "referrals", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "targets", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
