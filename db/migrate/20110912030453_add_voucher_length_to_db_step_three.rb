class AddVoucherLengthToDbStepThree < ActiveRecord::Migration
  def self.up
    add_column :db_step_threes, :voucher_length, :integer
  end

  def self.down
    remove_column :db_step_threes, :voucher_length
  end
end
