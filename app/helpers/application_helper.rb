module ApplicationHelper

  def url_fixer(url)
    if url.start_with?("http") || url.start_with?("https")
      url
    else
      "http://#{url}"
    end
  end
end
