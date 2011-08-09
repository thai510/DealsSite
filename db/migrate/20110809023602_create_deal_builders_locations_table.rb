class CreateDealBuildersLocationsTable < ActiveRecord::Migration
def self.up
    create_table :deal_builders_locations, :id => false do |t|
      t.references :deal_builder
      t.references :location
    end
    add_index :deal_builders_locations, [:deal_builder_id,
                                                     :location_id], :unique => true, :name => 'deals_locations'
    add_index :deal_builders_locations, [:location_id,
                                                     :deal_builder_id], :unique => true, :name => 'locations_deals'
  end

  def self.down
    drop_table :deal_builders_locations
  end

end
