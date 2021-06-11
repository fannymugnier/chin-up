class AddCurrentRoomsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_rooms, :integer, array: true, default: []
  end
end
