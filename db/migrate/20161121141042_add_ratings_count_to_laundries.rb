class AddRatingsCountToLaundries < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :ratings_count, :integer, default: 0
  end
end
