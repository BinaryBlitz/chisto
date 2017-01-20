class AddDeletedAtToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at
    add_column :items, :deleted_at, :datetime
    add_index :items, :deleted_at
    add_column :treatments, :deleted_at, :datetime
    add_index :treatments, :deleted_at
  end
end
