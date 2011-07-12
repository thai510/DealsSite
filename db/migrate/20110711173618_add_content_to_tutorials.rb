class AddContentToTutorials < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :content, :text
  end

  def self.down
    remove_column :tutorials, :content
  end
end
