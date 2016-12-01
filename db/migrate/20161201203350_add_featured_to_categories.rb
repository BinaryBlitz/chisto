class AddFeaturedToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :featured, :boolean, default: false
  end
end
