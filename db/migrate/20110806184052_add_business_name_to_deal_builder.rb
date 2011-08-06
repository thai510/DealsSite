class AddBusinessNameToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :business_name, :string
  end

  def self.down
    remove_column :deal_builders, :business_name
  end
end
