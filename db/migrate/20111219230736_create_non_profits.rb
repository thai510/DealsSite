class CreateNonProfits < ActiveRecord::Migration
  def self.up
    create_table :non_profits do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :non_profits
  end
end
