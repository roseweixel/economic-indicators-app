class AddQueryToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :query, :string
  end
end
