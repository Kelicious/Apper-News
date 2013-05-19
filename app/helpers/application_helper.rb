module ApplicationHelper
  def full_title(page_title)
    base_title = "Apper News"
    if page_title
      "#{base_title} | #{page_title}"
    else
      base_title
    end
  end
end
