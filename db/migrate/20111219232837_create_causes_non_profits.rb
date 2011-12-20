class CreateCausesNonProfits < ActiveRecord::Migration
  def self.up
   create_table :causes_non_profits, :id => false do |t|
      t.references :cause
      t.references :non_profit
    end
    add_index :causes_non_profits, [:cause_id, :non_profit_id]
    
  end

  def self.down
  end
end
