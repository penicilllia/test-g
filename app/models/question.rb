class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validate :body, presence: true

  validate :validate_answers_count, allow_nil: true

  private

  def validate_answers_count
    errors.add(:answers, message: "У вопроса может быть не ьольше 4 вариантов ответов.") if (answers.count > 4)
  end

end
