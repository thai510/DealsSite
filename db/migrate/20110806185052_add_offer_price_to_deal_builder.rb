class AddOfferPriceToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :offer_price, :integer
  end

  def self.down
    remove_column :deal_builders, :offer_price
  end
end
