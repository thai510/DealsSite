class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :deal_site_name
      t.string :contact_name
      t.string :contact_email
      t.integer :contact_phone
      t.string :product_name
      t.text :locations_served
      t.text :industries_served
      t.string :self_serve_product
      t.integer :minimum_required_discount
      t.text :revenue_share
      t.integer :minimum_number_of_vouchers
      t.text :payment_terms
      t.integer :time_length_standard_promo
      t.integer :quantity_credit_card_fee
      t.text :payer_credit_card_fee
      t.text :restrictions
      t.text :additional_info

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
