class Topic < ApplicationRecord
  validates :content, presence: true
end
