class CreateDbStepTwosLocationsTable < ActiveRecord::Migration
def self.up
    create_table :db_step_twos_locations, :id => false do |t|
      t.references :db_step_two
      t.references :location
    end
    add_index :db_step_twos_locations, [:db_step_two_id,
                                                     :location_id]
    add_index :db_step_twos_locations, [:location_id,
                                                     :db_step_two_id]
  end

  def self.down
    drop_table :db_step_twos_locations
  end

end
