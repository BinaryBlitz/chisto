class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :phone_number
      t.string :content

      t.timestamps
    end
  end
end
