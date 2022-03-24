class QuestionsController < ApplicationController

	rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  before_action :find_test, only: %i[create, index]
	before_action :find_question, only: %i[show, destroy]

	def index
		questions = @test.questions
		render plain: questions.inspect
	end

	def show
		render plain: @question.inspect
	end

	def new
		question = Question.new
	end

	def create
		question = @test.questions.new(question_params)
		if question.save
			render plain: question.inspect
		else
			render plain: "Параметры вопроса не валидные"
		end
	end

	def destroy
		@question.destroy
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

	def question_params
		params.require(:question).permit(:body)
	end

end
