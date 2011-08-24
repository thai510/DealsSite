class RemoveOfferLaunchDateFromDbStepTwos < ActiveRecord::Migration
  def self.up
    remove_column :db_step_twos, :offer_launch_date
  end

  def self.down
    add_column :db_step_twos, :offer_launch_date, :datetime
  end
end
