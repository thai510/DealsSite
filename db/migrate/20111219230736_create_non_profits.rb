class CreateNonProfits < ActiveRecord::Migration
  def self.up
    create_table :non_profits do |t|
      t.string :name
      t.text :description
      t.string :paypal_email
      t.string :contact_email
      t.string :phone_number
      t.string :np_photo_file_name
      t.string :np_photo_content_type
      t.integer :np_photo_file_size
      t.datetime :np_photo_updated_at
      t.string :zipcode

      t.timestamps
    end
  end

  def self.down
    drop_table :non_profits
  end
end
