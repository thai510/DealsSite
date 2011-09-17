class AddFbIncentiveTextToDbStepFour < ActiveRecord::Migration
  def self.up
    add_column :db_step_fours, :fb_incentive_text, :text
  end

  def self.down
    remove_column :db_step_fours, :fb_incentive_text
  end
end
