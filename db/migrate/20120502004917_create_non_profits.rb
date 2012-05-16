class CreateNonProfits < ActiveRecord::Migration
  def change
    create_table :non_profits do |t|
      t.string :title
      t.text :description
      t.string :website
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
  end
end
