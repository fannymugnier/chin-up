class CreateRoomTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :room_topics do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
