class TestsController < ApplicationController

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
		render plain: test.inspect
	end

	private

	def test_params
		params.require(:test).permit(:title, :level, :category_id)
	end

end
