class AddFbIncentiveToPrevPublish < ActiveRecord::Migration
  def self.up
    add_column :prev_publishes, :fb_incentive, :text
  end

  def self.down
    remove_column :prev_publishes, :fb_incentive
  end
end
