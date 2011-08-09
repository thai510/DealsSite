class CreateDealBuildersIndustryRestrictionsTable < ActiveRecord::Migration
def self.up
    create_table :deal_builders_industry_restrictions, :id => false do |t|
      t.references :deal_builder
      t.references :industry_restriction
    end
    add_index :deal_builders_industry_restrictions, [:deal_builder_id,
                                                     :industry_restriction_id], :unique => true, :name => 'deals_industry_restrictions'
    add_index :deal_builders_industry_restrictions, [:industry_restriction_id,
                                                     :deal_builder_id], :unique => true, :name => 'industry_restrictions_deals'
  end

  def self.down
    drop_table :deal_builders_industry_restrictions
  end
end
