class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :business_id 
      t.string :headline
      t.text :description
      t.integer :live
      t.text :fine_print
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :expiration_date
      t.datetime :start_date
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end
end
