class RoomTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :room
end
