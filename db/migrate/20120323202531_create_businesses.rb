class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :industry
      t.has_attached_file :logo
      t.string :phone_number
      t.string :website
      t.string :location
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.string :initial_password
      t.timestamps
    end
  end
end
