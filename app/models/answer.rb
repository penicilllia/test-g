class Answer < ApplicationRecord
  belongs_to :question

  validate :body, presence: true

  scope :right, -> { where(correct: :true) }
end
