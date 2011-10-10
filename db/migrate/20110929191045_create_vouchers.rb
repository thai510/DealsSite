class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.string :code
      t.integer :user_id
      t.string :redeemed
      t.string :customer_email
      t.integer :db_publish_id
      t.integer :prev_publish_id
      t.string :fb_incentive

      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
