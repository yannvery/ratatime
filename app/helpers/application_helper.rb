module ApplicationHelper
  def active_li_link_to(name = nil, url = nil, html_options = {}, options = nil)
    active_class = html_options[:active] || 'active'
    html_options.delete(:active)
    li_html_class = active_class if current_page?(options)
    content_tag :li, class: li_html_class do
      link_to(name, url, html_options)
    end
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      'alert-success'
    when :error
      'alert-error'
    when :alert
      'alert-block'
    when :notice
      'alert-info'
    else
      flash_type.to_s
    end
  end
end
