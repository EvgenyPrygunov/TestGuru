module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(type, message)
    content_tag :p, message, class: type
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success" # Green
      when :error
        "alert-danger" # Red
      when :alert
        "alert-warning" # Yellow
      when :notice
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end
end
