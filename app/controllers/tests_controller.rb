class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[ start ]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  private

  def test_not_found
    render plain: "Test Not Found", status: 404
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_user
    @user = User.first
  end

end
