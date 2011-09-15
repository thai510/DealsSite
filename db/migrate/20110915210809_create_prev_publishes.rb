class CreatePrevPublishes < ActiveRecord::Migration
  def self.up
    create_table :prev_publishes do |t|
      t.integer :max_number_of_vouchers
      t.integer :total_vouchers_sold
      t.datetime :start_of_deal
      t.text :incentive_ideas
      t.string :offer_title
      t.text :offer_description
      t.integer :offer_value
      t.integer :offer_price
      t.text :restrictions
      t.integer :voucher_length
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :coupon

      t.timestamps
    end
  end

  def self.down
    drop_table :prev_publishes
  end
end
