class AddStandardRestrictionToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :standard_restriction, :string
  end

  def self.down
    remove_column :deal_builders, :standard_restriction
  end
end
