class RemoveStandardRestrictionFromDealBuilder < ActiveRecord::Migration
  def self.up
    remove_column :deal_builders, :standard_restriction
  end

  def self.down
    add_column :deal_builders, :standard_restriction, :string
  end
end
