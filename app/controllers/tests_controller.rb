class TestsController < ApplicationController

	rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

	def index
		result = ["Class: #{params.class}", "Parametres: #{params.inspect}"]
		render plain: result.join("\n")
	end

	def show
		tests = Test.all
		render plain: tests.inspect
	end

	def new
	end

	def create
		test = Test.create(test_params)
		if test.save?
			render plain: test.inspect
		else
			render plain: "Параметры теста не валидные"
		end
	end

	private

	def test_not_found
		render plain: "Test Not Found", status: 404
	end

	def test_params
		params.require(:test).permit(:title, :level, :category_id)
	end

end
