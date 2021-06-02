class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true
  validates :message_type, presence: true
end
