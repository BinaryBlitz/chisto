class CreateSupportRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :support_requests do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
