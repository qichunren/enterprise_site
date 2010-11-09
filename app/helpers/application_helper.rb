module ApplicationHelper
  # set the title for the page
  def title(page_title)
    content_for(:title) do
      "#{page_title} - #{Settings.app.name}"
    end
  end
  
  # set the description for the page
  def description(page_description)
    content_for(:description) do
      "<meta name=\"description\" content=\"#{page_description}\" />\n"
    end
  end
  
  # set the keywords for the page
  def keywords(page_keywords)
    content_for(:keywords) do
      "<meta name=\"keywords\"  content=\"#{page_keywords}\" />\n"
    end
  end
  
  
  # OPTIMIZE
  def show_flash_messages
    raw([:notice, :warning, :message].collect do |key|
      content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
    end.join)
  end

  # OPTIMIZE
  def show_human_flash_messages
   [:notice, :warning, :message].each do |key|
     return raw("<script>$(window).humanMsg('#{flash[key]}'); </script>") unless flash[key].blank?
   end
   return ""
  end

  def google_analytics
    render "/shared/google_analytics_code"
  end
end
