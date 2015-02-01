class ChangeTotalFromIntegerToFloatInLineItems < ActiveRecord::Migration
  def change
    change_column :line_items, :total, :float
  end
end
