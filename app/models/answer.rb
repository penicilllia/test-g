class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: :true) }

  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers, message: "У вопроса может быть не ьольше 4 вариантов ответов.") if (question.answers.count > 4)
  end

end
