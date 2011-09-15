class AddTotalVouchersSoldToDbPublish < ActiveRecord::Migration
  def self.up
    add_column :db_publishes, :total_vouchers_sold, :integer
  end

  def self.down
    remove_column :db_publishes, :total_vouchers_sold
  end
end
