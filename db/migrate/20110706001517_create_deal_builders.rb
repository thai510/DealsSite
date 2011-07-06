class CreateDealBuilders < ActiveRecord::Migration
  def self.up
    create_table :deal_builders do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :deal_builders
  end
end
