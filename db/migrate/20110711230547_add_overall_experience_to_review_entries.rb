class AddOverallExperienceToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :overall_experience, :integer
  end

  def self.down
    remove_column :review_entries, :overall_experience
  end
end
