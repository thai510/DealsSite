class CreateDbStepOnes < ActiveRecord::Migration
  def self.up
    create_table :db_step_ones do |t|
      t.string :offer_title
      t.integer :offer_value
      t.integer :offer_price
      t.text :offer_description
      t.integer :deal_builder_id
      t.string  :coupon
      t.string :offer_photo_file_name
      t.string :offer_photo_content_type
      t.integer :offer_photo_file_size
      t.datetime :offer_photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_ones
  end
end
