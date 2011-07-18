class CreateSubindustriesUsersTable < ActiveRecord::Migration
  def self.up
    create_table :subindustries_users, :id => false do |t|
      t.references :subindustry
      t.references :user
    end
    add_index :subindustries_users, [:subindustry_id, :user_id]
    add_index :subindustries_users, [:user_id, :subindustry_id]
  end

  def self.down
    drop_table :subindustries_users
  end
end
