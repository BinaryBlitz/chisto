class AddFieldsToLaundries < ActiveRecord::Migration[5.0]
  def change
    rename_column :laundries, :image, :background_image
    add_reference :laundries, :city, foreign_key: false
    add_column :laundries, :minimum_order_price, :integer
    add_column :laundries, :minimum_collection_time, :integer
    add_column :laundries, :order_processing_time, :integer
  end
end
