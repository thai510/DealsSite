class AddDealBuilderIdToDbStepOne < ActiveRecord::Migration
  def self.up
    add_column :db_step_ones, :deal_builder_id, :integer
  end

  def self.down
    remove_column :db_step_ones, :deal_builder_id
  end
end
