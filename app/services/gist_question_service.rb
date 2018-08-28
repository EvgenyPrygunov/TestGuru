class GistQuestionService

  GITHUB_TOKEN = 'fae05c322d1a2e1bc235502542263c0a18e74cf7'# ENV['GITHUB_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: GITHUB_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
        description: "A question about #{@test.title} from TestGuru",
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
