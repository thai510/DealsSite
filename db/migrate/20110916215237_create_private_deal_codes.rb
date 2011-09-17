class CreatePrivateDealCodes < ActiveRecord::Migration
  def self.up
    create_table :private_deal_codes do |t|
      t.string :code
      t.integer :db_publish_id
      t.integer :times_used

      t.timestamps
    end
  end

  def self.down
    drop_table :private_deal_codes
  end
end
