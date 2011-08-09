class AddOptionalIncentiveToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :optional_incentive, :text
  end

  def self.down
    remove_column :deal_builders, :optional_incentive
  end
end
