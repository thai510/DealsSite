class CreateDbStepThrees < ActiveRecord::Migration
  def self.up
    create_table :db_step_threes do |t|
      t.text :optional_restriction

      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_threes
  end
end
