class CreateDbStepTwos < ActiveRecord::Migration
  def self.up
    create_table :db_step_twos do |t|
      t.datetime :offer_launch_date


      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_twos
  end
end
