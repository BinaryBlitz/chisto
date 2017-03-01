class AddLongOrderProcessingTimeToLaundries < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :long_order_processing_time, :integer
  end
end
