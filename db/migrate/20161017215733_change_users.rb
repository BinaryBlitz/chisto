class ChangeUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :address, :string, null: false
    add_reference :users, :city, foreign_key: false
    add_column :users, :street_name, :string
    add_column :users, :house_number, :string
    add_column :users, :apartment_number, :string
    add_column :users, :notes, :text
  end
end
