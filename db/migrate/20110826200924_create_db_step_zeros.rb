class CreateDbStepZeros < ActiveRecord::Migration
  def self.up
    create_table :db_step_zeros do |t|
      t.string :business_name
      t.text :business_description
      t.string :industry
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_zeros
  end
end
