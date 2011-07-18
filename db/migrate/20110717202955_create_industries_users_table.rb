class CreateIndustriesUsersTable < ActiveRecord::Migration
  def self.up
    create_table :industries_users, :id => false do |t|
      t.references :industry
      t.references :user
    end
    add_index :industries_users, [:industry_id, :user_id]
    add_index :industries_users, [:user_id, :industry_id]
  end

  def self.down
    drop_table :industries_users
  end
end
