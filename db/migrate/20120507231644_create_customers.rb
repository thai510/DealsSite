class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :zip
      t.string :cause
      t.string :ip
      t.timestamps
    end
  end
end
