class CreateStandardRestrictions < ActiveRecord::Migration
  def self.up
    create_table :standard_restrictions do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :standard_restrictions
  end
end
