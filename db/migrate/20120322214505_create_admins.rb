class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
