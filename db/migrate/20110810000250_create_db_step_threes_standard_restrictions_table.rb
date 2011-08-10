class CreateDbStepThreesStandardRestrictionsTable < ActiveRecord::Migration
  def self.up
    create_table :db_step_threes_standard_restrictions, :id => false do |t|
      t.references :db_step_three
      t.references :standard_restriction
    end
    add_index :db_step_threes_standard_restrictions, [:db_step_three_id,
                                                     :standard_restriction_id], :unique => true, :name => 'db_three_standard_restrictions'
    add_index :db_step_threes_standard_restrictions, [:standard_restriction_id,
                                                     :db_step_three_id], :unique => true, :name => 'standard_restrictions_db_three'
  end

  def self.down
    drop_table :db_step_threes_standard_restrictions
  end

end
