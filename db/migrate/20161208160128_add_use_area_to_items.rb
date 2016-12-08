class AddUseAreaToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :use_area, :boolean, default: false
  end
end
