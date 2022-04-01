module ApplicationHelper
  
  def current_year
    Time.now.strftime("%Y")
  end

  def github_url(author, repo)
    link_to "Проект test-guru", "https://github.com/#{author}/#{repo}/"
  end

end
