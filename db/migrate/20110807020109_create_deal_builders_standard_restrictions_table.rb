class CreateDealBuildersStandardRestrictionsTable < ActiveRecord::Migration
  def self.up
    create_table :deal_builders_standard_restrictions, :id => false do |t|
      t.references :deal_builder
      t.references :standard_restriction
    end
    add_index :deal_builders_standard_restrictions, [:deal_builder_id,
                                                     :standard_restriction_id], :unique => true, :name => 'deals_restrictions'
    add_index :deal_builders_standard_restrictions, [:standard_restriction_id,
                                                     :deal_builder_id], :unique => true, :name => 'restrictions_deals'
  end

  def self.down
    drop_table :deal_builders_standard_restrictions
  end
end
