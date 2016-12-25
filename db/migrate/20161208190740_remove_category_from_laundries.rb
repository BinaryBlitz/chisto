class RemoveCategoryFromLaundries < ActiveRecord::Migration[5.0]
  def change
    remove_column :laundries, :category, :string, default: ''
  end
end
