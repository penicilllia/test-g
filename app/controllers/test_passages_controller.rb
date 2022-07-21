class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passgae, only: %i[ show result update ]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
      TestsMailer.completed_test(@test_passage).deliver_now
      
    else
      render :show
    end
  end

  private

  def set_test_passgae
    @test_passage = TestPassage.find(params[:id])
  end
  
end
