class Answer < ApplicationRecord
  belongs_to :survey
  belongs_to :user
end
