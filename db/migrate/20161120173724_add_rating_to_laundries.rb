class AddRatingToLaundries < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :rating, :float, default: 0.0
  end
end
