module FrontendHelper

  def css_layout_class(set_name = nil)
    @_css_layout = set_name if set_name.present?
    "l-#{@_css_layout || "#{controller_name}-#{action_name}"}"
  end

  def concat_class(*args)
    args.compact.join(' ').split(' ').uniq.join(' ')
  end

  def link_to_menu_item(*args, &block)
    if block_given?
      body         = capture &block
      options      = args.first || {}
      html_options = args.second
    else
      body         = args[0]
      options      = args[1] || {}
      html_options = args[2]
    end
    html_options ||= {}
    html_options[:class] = concat_class 'item', ('active' if current_page?(options)), html_options[:class]
    _separator = html_options.delete(:separator) == false ? '' : '&nbsp;|&nbsp;'
    "#{_separator} #{link_to(body, options, html_options)}".html_safe
  end

end
