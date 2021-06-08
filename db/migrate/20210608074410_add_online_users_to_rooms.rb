class AddOnlineUsersToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :online_users, :integer, array: true, default: []
  end
end
