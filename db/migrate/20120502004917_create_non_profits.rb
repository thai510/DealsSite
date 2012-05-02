class CreateNonProfits < ActiveRecord::Migration
  def change
    create_table :non_profits do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
