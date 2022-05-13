class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  before_action :find_test, only: %i[ index ]
  before_action :find_question, only: %i[ show ]

  def index
    @questions = @test.questions
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: "Question Not Found", status: 404
  end

end
