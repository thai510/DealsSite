class CreateDbPublishes < ActiveRecord::Migration
  def self.up
    create_table :db_publishes do |t|
      t.integer :max_vouchers_to_sell
      t.integer :length_of_deal
      t.integer :deal_builder_id
      t.integer :cause_id
      t.integer :total_vouchers_sold
      t.string :private_deal

      t.timestamps
    end
  end

  def self.down
    drop_table :db_publishes
  end
end
