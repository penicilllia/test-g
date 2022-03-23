class QuestionsController < ApplicationController
  
	def index
		begin
			test = Test.find(params[:test_id])
			questions = test.questions
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
			return
		end
		render plain: questions.inspect
	end

	def show
		begin
			test = Test.find(params[:test_id])
			question = test.questions.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
			return
		end
		render plain: question.inspect
	end

	def new
		begin
			test = Test.find(params[:test_id])
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
			return
		end
		@test_id = test.id
		question = Question.new
	end

	def create
		begin
			test = Test.find(params[:test_id])
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
			return
		end
		question = test.questions.create(question_params)
		render plain: question.inspect
	end

	def destroy
		begin
			test = Test.find(params[:test_id])
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path
			return
		end
		question = test.questions.find(params[:id])
		question.destroy
	end

	private

	def question_params
		params.require(:question).permit(:body, :test_id)
	end

end
