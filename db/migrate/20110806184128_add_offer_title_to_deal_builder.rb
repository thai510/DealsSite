class AddOfferTitleToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :offer_title, :string
  end

  def self.down
    remove_column :deal_builders, :offer_title
  end
end
