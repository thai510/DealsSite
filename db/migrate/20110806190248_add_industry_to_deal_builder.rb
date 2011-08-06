class AddIndustryToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :industry, :string
  end

  def self.down
    remove_column :deal_builders, :industry
  end
end
