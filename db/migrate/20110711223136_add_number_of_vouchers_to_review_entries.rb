class AddNumberOfVouchersToReviewEntries < ActiveRecord::Migration
  def self.up
    add_column :review_entries, :number_of_vouchers, :integer
  end

  def self.down
    remove_column :review_entries, :number_of_vouchers
  end
end
