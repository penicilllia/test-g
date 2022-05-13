class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found
  
  before_action :find_test, only: %i[start]
  
  def index
    @tests = Test.all
  end
  
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  
  private
  
  def test_not_found
    render plain: "Test Not Found", status: 404
  end
  
  def find_test
    @test = Test.find(params[:id])
  end
  
end
  