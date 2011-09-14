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

ActiveRecord::Schema.define(:version => 20110913200336) do

  create_table "calculator_tools", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comparison_tools", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_publishes", :force => true do |t|
    t.integer  "max_vouchers_to_sell"
    t.integer  "length_of_deal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_builder_id"
  end

  create_table "db_step_fours", :force => true do |t|
    t.text     "optional_incentive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_builder_id"
  end

  create_table "db_step_fours_incentive_ideas", :id => false, :force => true do |t|
    t.integer "db_step_four_id"
    t.integer "incentive_idea_id"
  end

  add_index "db_step_fours_incentive_ideas", ["db_step_four_id", "incentive_idea_id"], :name => "db_four_incentive_ideas", :unique => true
  add_index "db_step_fours_incentive_ideas", ["incentive_idea_id", "db_step_four_id"], :name => "incentive_ideas_db_four", :unique => true

  create_table "db_step_ones", :force => true do |t|
    t.string   "offer_title"
    t.integer  "offer_value"
    t.integer  "offer_price"
    t.text     "offer_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_builder_id"
    t.string   "offer_photo_file_name"
    t.string   "offer_photo_content_type"
    t.integer  "offer_photo_file_size"
    t.datetime "offer_photo_updated_at"
    t.string   "coupon"
  end

  create_table "db_step_threes", :force => true do |t|
    t.text     "optional_restriction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_builder_id"
    t.integer  "voucher_length"
  end

  create_table "db_step_threes_standard_restrictions", :id => false, :force => true do |t|
    t.integer "db_step_three_id"
    t.integer "standard_restriction_id"
  end

  add_index "db_step_threes_standard_restrictions", ["db_step_three_id", "standard_restriction_id"], :name => "db_three_standard_restrictions", :unique => true
  add_index "db_step_threes_standard_restrictions", ["standard_restriction_id", "db_step_three_id"], :name => "standard_restrictions_db_three", :unique => true

  create_table "db_step_twos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_builder_id"
    t.string   "include_all"
  end

  create_table "db_step_zeros", :force => true do |t|
    t.string   "business_name"
    t.text     "business_description"
    t.string   "industry"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
    t.integer  "phone_number"
    t.string   "website"
  end

  create_table "deal_builders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
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

  create_table "form_tips", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incentive_ideas", :force => true do |t|
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

  create_table "industry_restrictions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "industry_id"
  end

  create_table "links", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "db_step_two_id"
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
    t.integer  "customer_service"
    t.string   "email"
  end

  create_table "samples", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standard_restrictions", :force => true do |t|
    t.string   "title"
    t.text     "description"
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
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
