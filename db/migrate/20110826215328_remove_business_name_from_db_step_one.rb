class RemoveBusinessNameFromDbStepOne < ActiveRecord::Migration
  def self.up
    remove_column :db_step_ones, :business_name
  end

  def self.down
    add_column :db_step_ones, :business_name, :string
  end
end
