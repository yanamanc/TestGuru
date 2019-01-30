class TestsController < ApplicationController
  before_action :find_test, only: %i[destroy show]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    render inline: '<% @tests.each { |test| %><p><%= test.title %></p><% } %>'
  end

  def show
    render plain: @test.title
  end

  def new
  end

  def edit
  end

  def create
    @test.create
  end

  def destroy
    @test.destroy
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end

end
