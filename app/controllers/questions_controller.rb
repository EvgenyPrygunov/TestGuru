class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<p><%= @test.questions.each do |question| %>
                      <p><%= question.body %></p>
                    <% end %>"
  end

  def show
    render inline: "<p><%= question.body %></p>"
  end

  def new

  end

  def create
    @test.questions.create(question_params)
    render plain: "<p>Question: '<%= question.body %>' was created.</p>"
  end

  def destroy
    @question.destroy
    render plain: "<p>Question: '<%= question.body %>' was destroyed.</p>"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end

end
