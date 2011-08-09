class CreateIndustryRestrictions < ActiveRecord::Migration
  def self.up
    create_table :industry_restrictions do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :industry_restrictions
  end
end
