class AddItemsPreviewToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :items_preview, :string, array: true
  end
end
