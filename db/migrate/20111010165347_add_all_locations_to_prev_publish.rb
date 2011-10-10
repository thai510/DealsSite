class AddAllLocationsToPrevPublish < ActiveRecord::Migration
  def self.up
    add_column :prev_publishes, :all_locations, :string
  end

  def self.down
    remove_column :prev_publishes, :all_locations
  end
end
