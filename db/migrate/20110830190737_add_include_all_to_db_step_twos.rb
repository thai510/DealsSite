class AddIncludeAllToDbStepTwos < ActiveRecord::Migration
  def self.up
    add_column :db_step_twos, :include_all, :string
  end

  def self.down
    remove_column :db_step_twos, :include_all
  end
end
