class Topic < ApplicationRecord
  validates :subject, presence: true
end
