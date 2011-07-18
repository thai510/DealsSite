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

ActiveRecord::Schema.define(:version => 20110718190444) do

  create_table "calculator_tools", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comparison_tools", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_builders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "industries", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "industries_users", :id => false, :force => true do |t|
    t.integer "industry_id"
    t.integer "user_id"
  end

  add_index "industries_users", ["industry_id", "user_id"], :name => "index_industries_users_on_industry_id_and_user_id"
  add_index "industries_users", ["user_id", "industry_id"], :name => "index_industries_users_on_user_id_and_industry_id"

  create_table "links", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marketing_plans", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_entries", :force => true do |t|
    t.string   "service"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_vouchers"
    t.text     "offer"
    t.integer  "level_of_new_business"
    t.integer  "returning_new_customers"
    t.integer  "overall_experience"
  end

  create_table "samples", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "deal_site_name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.integer  "contact_phone"
    t.string   "product_name"
    t.text     "locations_served"
    t.text     "industries_served"
    t.string   "self_serve_product"
    t.integer  "minimum_required_discount"
    t.text     "revenue_share"
    t.integer  "minimum_number_of_vouchers"
    t.text     "payment_terms"
    t.integer  "time_length_standard_promo"
    t.integer  "quantity_credit_card_fee"
    t.text     "payer_credit_card_fee"
    t.text     "restrictions"
    t.text     "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subindustries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industry_id"
  end

  create_table "subindustries_users", :id => false, :force => true do |t|
    t.integer "subindustry_id"
    t.integer "user_id"
  end

  add_index "subindustries_users", ["subindustry_id", "user_id"], :name => "index_subindustries_users_on_subindustry_id_and_user_id"
  add_index "subindustries_users", ["user_id", "subindustry_id"], :name => "index_subindustries_users_on_user_id_and_subindustry_id"

  create_table "tutorials", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "topic"
    t.text     "content"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode"
  end

end
