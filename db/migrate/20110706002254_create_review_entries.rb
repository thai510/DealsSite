class CreateReviewEntries < ActiveRecord::Migration
  def self.up
    create_table :review_entries do |t|
      t.string :service
      t.string :email
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :review_entries
  end
end
