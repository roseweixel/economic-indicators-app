class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :category_id
      t.integer :year
      t.integer :total
      t.timestamps
    end
  end
end
