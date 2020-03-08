module ApplicationHelper
  # ペ〜ジごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "insta"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  def bootstrap_alert(key)
    case key
    when "alert"
      "warning"
    when "notice"
      "success"
    when "error"
      "danger"
    end
  end
end
