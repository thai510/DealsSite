class CreateDbStepOnes < ActiveRecord::Migration
  def self.up
    create_table :db_step_ones do |t|
      t.string :business_name
      t.string :offer_title
      t.string :industry
      t.integer :offer_value
      t.integer :offer_price
      t.text :offer_description

      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_ones
  end
end
