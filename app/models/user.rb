class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_interests
  has_many :interests, through: :user_interests
  has_one_attached :photo

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :age, numericality: { only_integer: true }
  validates :age, presence: true
end
