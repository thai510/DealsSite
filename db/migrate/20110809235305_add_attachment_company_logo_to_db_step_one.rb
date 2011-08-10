class AddAttachmentCompanyLogoToDbStepOne < ActiveRecord::Migration
  def self.up
    add_column :db_step_ones, :company_logo_file_name, :string
    add_column :db_step_ones, :company_logo_content_type, :string
    add_column :db_step_ones, :company_logo_file_size, :integer
    add_column :db_step_ones, :company_logo_updated_at, :datetime
  end

  def self.down
    remove_column :db_step_ones, :company_logo_file_name
    remove_column :db_step_ones, :company_logo_content_type
    remove_column :db_step_ones, :company_logo_file_size
    remove_column :db_step_ones, :company_logo_updated_at
  end
end
