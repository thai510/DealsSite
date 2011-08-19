class AddDbStepTwoIdToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :db_step_two_id, :integer
  end

  def self.down
    remove_column :locations, :db_step_two_id
  end
end
