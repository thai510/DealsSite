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

ActiveRecord::Schema.define(:version => 20120507231830) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "industry"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "phone_number"
    t.string   "website"
    t.string   "location"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "initial_password"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.string   "zip"
    t.string   "cause"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "non_profits", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "offers", :force => true do |t|
    t.integer  "business_id"
    t.string   "headline"
    t.text     "description"
    t.integer  "live"
    t.text     "fine_print"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "expiration_date"
    t.datetime "start_date"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.string   "phone_number"
    t.string   "terms_of_use"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "vouchers", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "non_profit_id"
    t.string   "offer_id"
    t.string   "business_id"
    t.string   "code"
    t.integer  "redeemed"
    t.decimal  "purchase",      :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

end
