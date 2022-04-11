class TestPassagesController < ApplicationController

  before_action :set_test_passgae, only: %i[ show result update ]

  def show
    @count = session[:count] + 1
    session[:count] = @count + 1
  end

  def result
    @result_percent = @test_passage.correct_questions / @test_passage.test.questions.count * 100.0
    session[:count] = 0
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passgae
    @test_passage = TestPassage.find(params[:id])
  end
  
end
