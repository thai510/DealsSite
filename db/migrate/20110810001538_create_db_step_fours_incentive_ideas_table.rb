class CreateDbStepFoursIncentiveIdeasTable < ActiveRecord::Migration
 def self.up
    create_table :db_step_fours_incentive_ideas, :id => false do |t|
      t.references :db_step_four
      t.references :incentive_idea
    end
    add_index :db_step_fours_incentive_ideas, [:db_step_four_id,
                                                     :incentive_idea_id], :unique => true, :name => 'db_four_incentive_ideas'
    add_index :db_step_fours_incentive_ideas, [:incentive_idea_id,
                                                     :db_step_four_id], :unique => true, :name => 'incentive_ideas_db_four'
  end

  def self.down
    drop_table :db_step_fours_incentive_ideas
  end
end
