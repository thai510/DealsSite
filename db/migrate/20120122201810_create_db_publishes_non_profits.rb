class CreateDbPublishesNonProfits < ActiveRecord::Migration
  def self.up
    create_table :db_publishes_non_profits, :id => false do |t|
      t.references :db_publish
      t.references :non_profit
    end
    add_index :db_publishes_non_profits, [:db_publish_id, :non_profit_id], :unique => true, :name => 'db_publishes_nps'
  end

  def self.down
    drop_table :db_publishes_non_profits
  end
end
