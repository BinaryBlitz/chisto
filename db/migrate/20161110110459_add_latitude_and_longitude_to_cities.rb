class AddLatitudeAndLongitudeToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :latitude, :float, null: false
    add_column :cities, :longitude, :float, null: false
  end
end
