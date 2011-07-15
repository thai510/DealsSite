class AddTitleToIndustries < ActiveRecord::Migration
  def self.up
    add_column :industries, :title, :string
  end

  def self.down
    remove_column :industries, :title
  end
end
