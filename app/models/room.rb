class Room < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  has_many :room_interests
  has_many :interests, through: :room_interests
  has_many :surveys
  has_many :room_topics
  has_many :topics, through: :room_topics

  validates :name, presence: true
  validates :description, presence: true

end
