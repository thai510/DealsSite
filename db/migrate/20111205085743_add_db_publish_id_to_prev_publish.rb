class AddDbPublishIdToPrevPublish < ActiveRecord::Migration
  def self.up
    add_column :prev_publishes, :db_publish_id, :integer
  end

  def self.down
    remove_column :prev_publishes, :db_publish_id
  end
end
