class ChangeLaundries < ActiveRecord::Migration[5.0]
  def change
    change_column :laundries, :category, :string, default: '', null: true
  end
end
