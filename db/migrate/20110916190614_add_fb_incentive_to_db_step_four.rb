class AddFbIncentiveToDbStepFour < ActiveRecord::Migration
  def self.up
    add_column :db_step_fours, :fb_incentive, :string
  end

  def self.down
    remove_column :db_step_fours, :fb_incentive
  end
end
