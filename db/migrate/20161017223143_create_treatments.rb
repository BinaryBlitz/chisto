class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.belongs_to :item, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
