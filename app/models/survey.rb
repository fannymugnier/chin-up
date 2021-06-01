class Survey < ApplicationRecord
  has_many :answers

  validates :title, presence: true
  validates :first_proposition, presence: true
  validates :second_proposition, presence: true
end
