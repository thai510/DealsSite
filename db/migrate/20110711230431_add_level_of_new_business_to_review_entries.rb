class AddLevelOfNewBusinessToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :level_of_new_business, :integer
  end

  def self.down
    remove_column :review_entries, :level_of_new_business
  end
end
