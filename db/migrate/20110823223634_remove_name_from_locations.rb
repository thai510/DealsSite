class RemoveNameFromLocations < ActiveRecord::Migration
  def self.up
    remove_column :locations, :name
  end

  def self.down
    add_column :locations, :name, :string
  end
end
