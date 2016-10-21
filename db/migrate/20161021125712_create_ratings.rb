class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :laundry, foreign_key: true
      t.integer :value, null: false
      t.text :content
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
