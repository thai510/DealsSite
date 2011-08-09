class AddIndustryIdToIndustryRestrictions < ActiveRecord::Migration
  def self.up
    add_column :industry_restrictions, :industry_id, :integer
  end

  def self.down
    remove_column :industry_restrictions, :industry_id
  end
end
