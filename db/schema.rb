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

ActiveRecord::Schema.define(:version => 20111219232837) do

  create_table "calculator_tools", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes_non_profits", :id => false, :force => true do |t|
    t.integer "cause_id"
    t.integer "non_profit_id"
  end

  add_index "causes_non_profits", ["cause_id", "non_profit_id"], :name => "index_causes_non_profits_on_cause_id_and_non_profit_id"

  create_table "db_publishes", :force => true do |t|
    t.integer  "max_vouchers_to_sell"
    t.integer  "length_of_deal"
    t.integer  "deal_builder_id"
    t.integer  "cause_id"
    t.integer  "total_vouchers_sold"
    t.string   "private_deal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_step_fours", :force => true do |t|
    t.text     "optional_incentive"
    t.string   "fb_incentive"
    t.text     "fb_incentive_text"
    t.integer  "deal_builder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_step_ones", :force => true do |t|
    t.string   "offer_title"
    t.integer  "offer_value"
    t.integer  "offer_price"
    t.text     "offer_description"
    t.integer  "deal_builder_id"
    t.string   "coupon"
    t.string   "offer_photo_file_name"
    t.string   "offer_photo_content_type"
    t.integer  "offer_photo_file_size"
    t.datetime "offer_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_step_threes", :force => true do |t|
    t.text     "optional_restriction"
    t.integer  "deal_builder_id"
    t.integer  "voucher_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_step_threes_standard_restrictions", :id => false, :force => true do |t|
    t.integer "db_step_three_id"
    t.integer "standard_restriction_id"
  end

  add_index "db_step_threes_standard_restrictions", ["db_step_three_id", "standard_restriction_id"], :name => "db_three_standard_restrictions", :unique => true
  add_index "db_step_threes_standard_restrictions", ["standard_restriction_id", "db_step_three_id"], :name => "standard_restrictions_db_three", :unique => true

  create_table "db_step_twos", :force => true do |t|
    t.integer  "deal_builder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_step_zeros", :force => true do |t|
    t.string   "business_name"
    t.text     "business_description"
    t.string   "industry"
    t.integer  "user_id"
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_builders", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_share_codes", :force => true do |t|
    t.string   "code"
    t.integer  "db_publish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_tips", :force => true do |t|
    t.string   "title"
    t.text     "description"
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

  create_table "locations", :force => true do |t|
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "db_step_two_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "non_profits", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "paypal_email"
    t.string   "contact_email"
    t.string   "phone_number"
    t.string   "np_photo_file_name"
    t.string   "np_photo_content_type"
    t.integer  "np_photo_file_size"
    t.datetime "np_photo_updated_at"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prev_publishes", :force => true do |t|
    t.integer  "max_vouchers_to_sell"
    t.integer  "total_vouchers_sold"
    t.datetime "start_of_deal"
    t.text     "optional_incentive"
    t.string   "offer_title"
    t.text     "offer_description"
    t.integer  "length_of_deal"
    t.string   "offer_photo_file_name"
    t.string   "offer_photo_content_type"
    t.integer  "offer_photo_file_size"
    t.datetime "offer_photo_updated_at"
    t.integer  "offer_value"
    t.integer  "offer_price"
    t.text     "restrictions"
    t.integer  "voucher_length"
    t.integer  "location_id"
    t.string   "coupon"
    t.integer  "user_id"
    t.string   "fb_incentive"
    t.text     "fb_incentive_text"
    t.string   "private_deal"
    t.integer  "db_publish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_deal_codes", :force => true do |t|
    t.string   "code"
    t.integer  "db_publish_id"
    t.integer  "times_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standard_restrictions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipcode"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "vouchers", :force => true do |t|
    t.string   "code"
    t.integer  "user_id"
    t.string   "redeemed"
    t.string   "customer_email"
    t.integer  "db_publish_id"
    t.integer  "prev_publish_id"
    t.string   "fb_incentive"
    t.string   "coupon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
