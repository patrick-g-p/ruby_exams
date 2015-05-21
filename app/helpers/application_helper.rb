module ApplicationHelper

  def url_fixer(url)
    if url.start_with?("http") || url.start_with?("https")
      url
    else
      "http://#{url}"
    end
  end

  def friendly_date_time_fixer(date)
    if logged_in? && !current_user.time_zone.blank?
      date = date.in_time_zone(current_user.time_zone)
    end

    date.strftime(format="%m/%d/%Y at %l:%M%P %Z")
  end

  def capitalize_names(string)
    string.titleize
  end
end
