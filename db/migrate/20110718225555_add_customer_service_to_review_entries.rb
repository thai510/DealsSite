class AddCustomerServiceToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :customer_service, :integer
  end

  def self.down
    remove_column :review_entries, :customer_service
  end
end
