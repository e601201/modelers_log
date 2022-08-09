module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Modelers Log'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def emmbed_svg(object)
    YAML.load_file('icon_svg.yml')[object]
  end
end
