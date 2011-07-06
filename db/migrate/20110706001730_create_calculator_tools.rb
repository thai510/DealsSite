class CreateCalculatorTools < ActiveRecord::Migration
  def self.up
    create_table :calculator_tools do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :calculator_tools
  end
end
