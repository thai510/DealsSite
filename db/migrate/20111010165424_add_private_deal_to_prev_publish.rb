class AddPrivateDealToPrevPublish < ActiveRecord::Migration
  def self.up
    add_column :prev_publishes, :private_deal, :string
  end

  def self.down
    remove_column :prev_publishes, :private_deal
  end
end
