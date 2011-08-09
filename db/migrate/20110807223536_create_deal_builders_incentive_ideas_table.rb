class CreateDealBuildersIncentiveIdeasTable < ActiveRecord::Migration
def self.up
    create_table :deal_builders_incentive_ideas, :id => false do |t|
      t.references :deal_builder
      t.references :incentive_idea
    end
    add_index :deal_builders_incentive_ideas, [:deal_builder_id,
                                                     :incentive_idea_id], :unique => true, :name => 'deals_incentive_ideas'
    add_index :deal_builders_incentive_ideas, [:incentive_idea_id,
                                                     :deal_builder_id], :unique => true, :name => 'incentive_ideas_deals'
  end

  def self.down
    drop_table :deal_builders_incentive_ideas
  end
end
