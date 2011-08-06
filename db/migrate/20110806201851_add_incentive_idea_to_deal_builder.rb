class AddIncentiveIdeaToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :incentive_idea, :string
  end

  def self.down
    remove_column :deal_builders, :incentive_idea
  end
end
