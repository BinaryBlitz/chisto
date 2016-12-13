class AddItemsCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :items_count, :integer, default: 0
  end
end
