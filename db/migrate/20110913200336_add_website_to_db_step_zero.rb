class AddWebsiteToDbStepZero < ActiveRecord::Migration
  def self.up
    add_column :db_step_zeros, :website, :string
  end

  def self.down
    remove_column :db_step_zeros, :website
  end
end
