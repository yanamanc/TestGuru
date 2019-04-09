class GistQuestionService
  attr_accessor :gist

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV['TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_params
    {
      description: I18n.t('gist_description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
