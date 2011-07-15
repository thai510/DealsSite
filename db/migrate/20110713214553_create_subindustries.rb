class CreateSubindustries < ActiveRecord::Migration
  def self.up
    create_table :subindustries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :subindustries
  end
end
