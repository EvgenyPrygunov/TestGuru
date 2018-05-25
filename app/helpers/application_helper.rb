module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(type)
    content_tag :p, flash[type], class: 'flash alert' if flash[type]
  end
end
