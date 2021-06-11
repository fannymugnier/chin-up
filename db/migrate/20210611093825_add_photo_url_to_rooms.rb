class AddPhotoUrlToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :photo_url, :string
  end
end
