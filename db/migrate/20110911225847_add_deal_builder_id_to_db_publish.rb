class AddDealBuilderIdToDbPublish < ActiveRecord::Migration
  def self.up
    add_column :db_publishes, :deal_builder_id, :integer
  end

  def self.down
    remove_column :db_publishes, :deal_builder_id
  end
end
