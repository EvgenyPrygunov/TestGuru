module ApplicationHelper

  BOOTSTRAP_CSS_CLASSES = { success: 'alert-success', error: 'alert-danger', alert:  'alert-warning', notice:  'alert-info' }

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
    BOOTSTRAP_CSS_CLASSES[flash_type]
  end
end
