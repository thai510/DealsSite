class CreateDbStepFours < ActiveRecord::Migration
  def self.up
    create_table :db_step_fours do |t|
      t.text   :optional_incentive
      t.string :fb_incentive
      t.text   :fb_incentive_text
      t.integer :deal_builder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_fours
  end
end
