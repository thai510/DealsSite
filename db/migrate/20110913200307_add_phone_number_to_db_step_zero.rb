class AddPhoneNumberToDbStepZero < ActiveRecord::Migration
  def self.up
    add_column :db_step_zeros, :phone_number, :integer
  end

  def self.down
    remove_column :db_step_zeros, :phone_number
  end
end
