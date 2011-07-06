class CreateComparisonTools < ActiveRecord::Migration
  def self.up
    create_table :comparison_tools do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :comparison_tools
  end
end
