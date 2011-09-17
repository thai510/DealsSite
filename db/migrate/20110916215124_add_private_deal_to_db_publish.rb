class AddPrivateDealToDbPublish < ActiveRecord::Migration
  def self.up
    add_column :db_publishes, :private_deal, :string
  end

  def self.down
    remove_column :db_publishes, :private_deal
  end
end
