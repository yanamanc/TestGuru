module AuthorHelper
  def github_link(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: :blank
  end
end
