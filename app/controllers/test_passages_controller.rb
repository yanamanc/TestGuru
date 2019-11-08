class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    
    if service.success?
      current_user.gists.create(question: @test_passage.current_question, url: result[:html_url])
      flash[:success] = view_context.link_to(t('.success'), result[:html_url])
    else
      flash[:success] = t('.failure', link: result.html_url)
    end
    redirect_to @test_passage
  end

   def result
    @test_passage.user.rewards << Reward.new(@test_passage) if valid?
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def valid?
    @test_passage.success? && !repeated?
  end

  def repeated?
    @test_passage.user.rewards.find_by(test_id: @test_passage.test_id)
  end
end
