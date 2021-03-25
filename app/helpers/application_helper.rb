module ApplicationHelper
  BASE_TITLE = 'Ruby on Rails Tutorial Sample App'.freeze
  # 定数の上書きを防ぐため

  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} | #{BASE_TITLE}"
    end
  end
end
