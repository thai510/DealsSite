class AddUserIdToDealBuilder < ActiveRecord::Migration
  def self.up
    add_column :deal_builders, :user_id, :integer
  end

  def self.down
    remove_column :deal_builders, :user_id
  end
end
