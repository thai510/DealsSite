class AddDateStringToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :date_string, :string

  end
end
