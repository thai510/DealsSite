class AddOfferLaunchDateToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :offer_launch_date, :string
  end

  def self.down
    remove_column :deal_builders, :offer_launch_date
  end
end
