class AddUserIdToPrevPublish < ActiveRecord::Migration
  def self.up
    add_column :prev_publishes, :user_id, :integer
  end

  def self.down
    remove_column :prev_publishes, :user_id
  end
end
