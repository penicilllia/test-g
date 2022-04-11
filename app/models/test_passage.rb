class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_set_next_question, on: :update

  SUCCESS_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def question_number
    self.test.questions.index(current_question) + 1
  end

  def test_result
    self.correct_questions.to_f / self.test.questions.count.to_f * 100.0
  end

  def success?
    test_result >= SUCCESS_PERCENT
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_set_next_question
    self.current_question = next_question
  end


  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.test.questions.order(:id).where('id > ?', self.current_question.id).first
  end

end
