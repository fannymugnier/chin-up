class CreateRoomInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :room_interests do |t|
      t.string :room_references
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
