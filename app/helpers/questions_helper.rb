module QuestionsHelper

  def question_header(question)
    question.test.title
  end

  def current_year
    Time.now.strftime("%Y")
  end

  def github_url(author, repo)
    git_url = "https://github.com/" + author + "/" + repo + "/"
    return git_url
  end

end
