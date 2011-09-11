class AddCouponToDbStepOne < ActiveRecord::Migration
  def self.up
    add_column :db_step_ones, :coupon, :string
  end

  def self.down
    remove_column :db_step_ones, :coupon
  end
end
