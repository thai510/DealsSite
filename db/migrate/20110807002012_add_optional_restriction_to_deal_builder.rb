class AddOptionalRestrictionToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :optional_restriction, :text
  end

  def self.down
    remove_column :deal_builders, :optional_restriction
  end
end
