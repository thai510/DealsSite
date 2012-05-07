class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :phone_number
      t.string :terms_of_use
      t.timestamps
    end
  end
end
