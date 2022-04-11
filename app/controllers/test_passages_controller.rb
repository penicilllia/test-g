class TestPassagesController < ApplicationController

  before_action :set_test_passgae, only: %i[ show result update ]

  def show
  end

  def result
    @result_percent = @test_passage.correct_questions.to_f / @test_passage.test.questions.count.to_f * 100.0
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
