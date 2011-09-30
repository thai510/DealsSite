class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.string :code
      t.integer :user_id
      t.string :redeemed
      t.string :offer_title
      t.text :offer_description
      t.integer :offer_price
      t.integer :offer_value
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :all_locations
      t.text :restrictions
      t.integer :voucher_length
      t.text :incentives
      t.string :customer_email

      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
