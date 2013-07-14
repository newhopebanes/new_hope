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

ActiveRecord::Schema.define(:version => 20130714160543) do

  create_table "addresses", :force => true do |t|
    t.string   "event_id"
    t.string   "number"
    t.string   "street"
    t.string   "district"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "complex_dates", :force => true do |t|
    t.string   "event_id",           :null => false
    t.integer  "date_type_id",       :null => false
    t.date     "fixed_date"
    t.time     "time"
    t.integer  "offset_type_id"
    t.integer  "fixed_offset_id"
    t.integer  "dynamic_offset_id"
    t.integer  "frequency_id"
    t.integer  "fixed_frequency_id"
    t.integer  "day_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "date_types", :force => true do |t|
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

  create_table "document_types", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "document_type_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "document_link_file_name"
    t.string   "document_link_content_type"
    t.integer  "document_link_file_size"
    t.datetime "document_link_updated_at"
  end

  create_table "dynamic_offsets", :force => true do |t|
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
    t.integer  "complex_date_id"
    t.string   "cost",               :null => false
    t.boolean  "access",             :null => false
    t.string   "access_details"
    t.integer  "referral_id"
    t.string   "joining_process"
    t.string   "directions_car"
    t.string   "directions_walking"
    t.string   "directions_bus"
    t.string   "directions_train"
    t.string   "other"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "address_id"
  end

  create_table "fixed_frequencies", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fixed_offsets", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "frequencies", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",                   :null => false
    t.string   "description",            :null => false
    t.string   "date"
    t.string   "time"
    t.string   "venue"
    t.string   "joining"
    t.string   "contact"
    t.string   "cost"
    t.string   "access"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "address_id"
    t.string   "image_one_file_name"
    t.string   "image_one_content_type"
    t.integer  "image_one_file_size"
    t.datetime "image_one_updated_at"
  end

  create_table "link_types", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "phone"
    t.string   "location"
    t.string   "opening"
    t.text     "text"
    t.integer  "link_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "messages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offset_types", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "referrals", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tagsets", :force => true do |t|
    t.integer  "event_id"
    t.boolean  "arts"
    t.boolean  "sports"
    t.boolean  "outdoors"
    t.boolean  "creative"
    t.boolean  "wellbeing"
    t.boolean  "social"
    t.boolean  "faith"
    t.boolean  "food"
    t.boolean  "learning"
    t.boolean  "exercise"
    t.boolean  "lifestyle"
    t.string   "other"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "targetsets", :force => true do |t|
    t.integer  "event_id"
    t.boolean  "adults"
    t.boolean  "under_18"
    t.boolean  "men"
    t.boolean  "women"
    t.boolean  "mental_health"
    t.boolean  "learning_difficulties"
    t.boolean  "drug_alcohol"
    t.boolean  "homelessness"
    t.boolean  "carers"
    t.boolean  "carers_mental_health"
    t.boolean  "vulnerable"
    t.boolean  "anyone"
    t.string   "other"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "updates", :force => true do |t|
    t.string   "description"
    t.string   "area"
    t.string   "action"
    t.string   "user"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
