class AddReturningNewCustomersToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :returning_new_customers, :integer
  end

  def self.down
    remove_column :review_entries, :returning_new_customers
  end
end
