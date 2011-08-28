class RemoveIndustryFromDbStepOne < ActiveRecord::Migration
  def self.up
    remove_column :db_step_ones, :industry
  end

  def self.down
    add_column :db_step_ones, :industry, :string
  end
end
