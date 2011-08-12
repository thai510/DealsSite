class CreateFormTips < ActiveRecord::Migration
  def self.up
    create_table :form_tips do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :form_tips
  end
end
