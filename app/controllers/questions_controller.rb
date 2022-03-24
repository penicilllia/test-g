class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index, create]

	def index
		#test = Test.find(params[:test_id])
		questions = @test.questions
		render plain: questions.inspect
	end

	def show
		question = Question.find(params[:id])
		render plain: question.inspect
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
		question = Question.find(params[:id])
		question.destroy
	end

	private

	def find_test
		@test = Test.find(params[:test_id])
	end

	def question_params
		params.require(:question).permit(:body)
	end

end
