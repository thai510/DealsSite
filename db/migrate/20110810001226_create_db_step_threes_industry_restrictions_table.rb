class CreateDbStepThreesIndustryRestrictionsTable < ActiveRecord::Migration
 def self.up
    create_table :db_step_threes_industry_restrictions, :id => false do |t|
      t.references :db_step_three
      t.references :industry_restriction
    end
    add_index :db_step_threes_industry_restrictions, [:db_step_three_id,
                                                     :industry_restriction_id], :unique => true, :name => 'db_three_industry_restrictions'
    add_index :db_step_threes_industry_restrictions, [:industry_restriction_id,
                                                     :db_step_three_id], :unique => true, :name => 'industry_restrictions_db_three'
  end

  def self.down
    drop_table :db_step_threes_industry_restrictions
  end
end
