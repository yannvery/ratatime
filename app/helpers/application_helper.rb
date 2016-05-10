module ApplicationHelper
  def active_li_link_to(name = nil, url = nil, html_options = {}, options = nil)
    active_class = html_options[:active] || 'active'
    html_options.delete(:active)
    li_html_class = active_class if current_page?(options)
    content_tag :li, class: li_html_class do
      link_to(name, url, html_options)
    end
  end
end
