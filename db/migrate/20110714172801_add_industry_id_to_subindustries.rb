class AddIndustryIdToSubindustries < ActiveRecord::Migration
  def self.up
    add_column :subindustries, :industry_id, :integer
  end

  def self.down
    remove_column :subindustries, :industry_id
  end
end
