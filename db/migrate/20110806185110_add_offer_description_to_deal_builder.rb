class AddOfferDescriptionToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :offer_description, :text
  end

  def self.down
    remove_column :deal_builders, :offer_description
  end
end
