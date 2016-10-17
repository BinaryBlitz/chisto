class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :category, foreign_key: true
      t.string :name, null: false
      t.string :icon
      t.text :description

      t.timestamps
    end
  end
end
