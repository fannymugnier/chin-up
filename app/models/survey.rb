class Survey < ApplicationRecord
  has_many :answers
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :first_proposition, presence: true
  validates :second_proposition, presence: true
  validates :author, presence: true
end
