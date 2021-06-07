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


  def first_proposition_count
    answers.where(selected_proposition: first_proposition).count
  end

  def second_proposition_count
    answers.where(selected_proposition: second_proposition).count
  end

  def first_proposition_percent
    return if answers.count.zero?

    first_proposition_count * 100 / answers.count
  end

  def second_proposition_percent
    return if answers.count.zero?

    second_proposition_count * 100 / answers.count
  end
end
