class AddDeletedAtToLaundries < ActiveRecord::Migration[5.1]
  def change
    add_column :laundries, :deleted_at, :datetime
    add_index :laundries, :deleted_at
  end
end
