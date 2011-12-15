class CreateDbStepZeros < ActiveRecord::Migration
  def self.up
    create_table :db_step_zeros do |t|
      t.string :business_name
      t.text :business_description
      t.string :industry
      t.integer :user_id
      t.string :company_logo_file_name
      t.string :company_logo_content_type
      t.integer :company_logo_file_size
      t.datetime :company_logo_updated_at
      t.string :phone_number
      t.string :website 

      t.timestamps
    end
  end

  def self.down
    drop_table :db_step_zeros
  end
end
