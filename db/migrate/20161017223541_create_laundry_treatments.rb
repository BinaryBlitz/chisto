class CreateLaundryTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :laundry_treatments do |t|
      t.references :laundry, foreign_key: true
      t.references :treatment, foreign_key: true
      t.integer :price, null: false

      t.timestamps
    end
  end
end
