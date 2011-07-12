class AddTopicToTutorials < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :topic, :string
  end

  def self.down
    remove_column :tutorials, :topic
  end
end
