class AddDeviceTokenAndPlatformToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :device_token, :string
    add_column :users, :platform, :integer, default: 0
  end
end
