class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true

  validates :validate_answers_count, allow_nil: true

  private

  def validate_answers_count
    errors.add(:answers) if (answers.count > 4)
  end

end
