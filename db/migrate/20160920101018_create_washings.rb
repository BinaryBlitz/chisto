class CreateWashings < ActiveRecord::Migration[5.0]
  def change
    create_table :washings do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :logo
      t.string :image
      t.string :category, null: false

      t.timestamps
    end
  end
end
