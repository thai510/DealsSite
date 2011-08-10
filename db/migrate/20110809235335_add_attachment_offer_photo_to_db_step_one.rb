class AddAttachmentOfferPhotoToDbStepOne < ActiveRecord::Migration
  def self.up
    add_column :db_step_ones, :offer_photo_file_name, :string
    add_column :db_step_ones, :offer_photo_content_type, :string
    add_column :db_step_ones, :offer_photo_file_size, :integer
    add_column :db_step_ones, :offer_photo_updated_at, :datetime
  end

  def self.down
    remove_column :db_step_ones, :offer_photo_file_name
    remove_column :db_step_ones, :offer_photo_content_type
    remove_column :db_step_ones, :offer_photo_file_size
    remove_column :db_step_ones, :offer_photo_updated_at
  end
end
