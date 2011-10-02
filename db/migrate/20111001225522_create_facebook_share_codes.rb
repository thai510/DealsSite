class CreateFacebookShareCodes < ActiveRecord::Migration
  def self.up
    create_table :facebook_share_codes do |t|
      t.string :code
      t.integer :db_publish_id

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_share_codes
  end
end
