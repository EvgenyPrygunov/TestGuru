class TestPassagesController < AuthenticatedController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result&.html_url.success?
                      create_gist!(result.html_url)
                      { notice: t('test_passages.gist.success', link: result.html_url) }
                    else
                      { alert: t('test_passages.gist.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist!(url)
    current_user.gists.create!(
        question: @test_passage.current_question,
        url: url
    )
  end

end
