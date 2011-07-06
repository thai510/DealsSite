class CreateMarketingPlans < ActiveRecord::Migration
  def self.up
    create_table :marketing_plans do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :marketing_plans
  end
end
