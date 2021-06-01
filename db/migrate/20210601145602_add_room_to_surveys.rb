class AddRoomToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_reference :surveys, :room, null: false, foreign_key: true
  end
end
