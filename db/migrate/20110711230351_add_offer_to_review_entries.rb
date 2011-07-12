class AddOfferToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :offer, :text
  end

  def self.down
    remove_column :review_entries, :offer
  end
end
