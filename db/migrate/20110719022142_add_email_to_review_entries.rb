class AddEmailToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :email, :string
  end

  def self.down
    remove_column :review_entries, :email
  end
end
