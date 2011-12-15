class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :db_step_two_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
