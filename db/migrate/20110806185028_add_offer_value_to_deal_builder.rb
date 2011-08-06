class AddOfferValueToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :offer_value, :integer
  end

  def self.down
    remove_column :deal_builders, :offer_value
  end
end
