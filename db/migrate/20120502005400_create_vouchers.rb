class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :email
      t.string :name
      t.string :note
      t.string :non_profit_id
      t.string :offer_id
      t.string :business_id
      t.string :code
      t.integer :redeemed
      t.decimal :purchase, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
