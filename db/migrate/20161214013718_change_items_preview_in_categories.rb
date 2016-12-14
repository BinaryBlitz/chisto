class ChangeItemsPreviewInCategories < ActiveRecord::Migration[5.0]
  def change
    change_column_default :categories, :items_preview, from: nil, to: []
  end
end
