class RemoveIncentiveIdeaFromDealBuilder < ActiveRecord::Migration
  def self.up
    remove_column :deal_builders, :incentive_idea
  end

  def self.down
    add_column :deal_builders, :incentive_idea, :string
  end
end
