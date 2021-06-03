class Survey < ApplicationRecord
  has_many :answers
  belongs_to :author, class_name: "User"
  belongs_to :room
  has_one_attached :first_photo
  has_one_attached :second_photo

  validates :title, presence: true
  validates :first_proposition, presence: true
  validates :second_proposition, presence: true
  validates :author, presence: true
end
