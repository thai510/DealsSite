class CreatePrevPublishes < ActiveRecord::Migration
  def self.up
    create_table :prev_publishes do |t|
      t.integer :max_vouchers_to_sell
      t.integer :total_vouchers_sold
      t.datetime :start_of_deal
      t.text :optional_incentive
      t.string :offer_title
      t.text :offer_description
      t.integer :length_of_deal
      t.string :offer_photo_file_name
      t.string :offer_photo_content_type
      t.integer :offer_photo_file_size
      t.datetime :offer_photo_updated_at
      t.integer :offer_value
      t.integer :offer_price
      t.text :restrictions
      t.integer :voucher_length
      t.integer :location_id
      t.string :coupon
      t.integer :user_id
      t.string :fb_incentive
      t.text   :fb_incentive_text
      t.string :private_deal
      t.integer :db_publish_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prev_publishes
  end
end
