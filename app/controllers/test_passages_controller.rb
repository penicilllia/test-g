class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passgae, only: %i[ show result update gist ]

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

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    
    result = service.call
    flash_options = if result.success?
      @question.gists.create(url: result[:html_url], user_id: current_user.id)
      { notice: t('.success') + "  #{ helpers.link_to( 'gist', result[:html_url], html_options: { target: '_blank' }) }" }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passgae
    @test_passage = TestPassage.find(params[:id])
  end
  
end
