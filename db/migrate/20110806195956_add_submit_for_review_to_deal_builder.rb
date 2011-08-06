class AddSubmitForReviewToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :submit_for_review, :string
  end

  def self.down
    remove_column :deal_builders, :submit_for_review
  end
end
