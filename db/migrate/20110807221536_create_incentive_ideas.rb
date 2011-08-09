class CreateIncentiveIdeas < ActiveRecord::Migration
  def self.up
    create_table :incentive_ideas do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :incentive_ideas
  end
end
