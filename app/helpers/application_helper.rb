module ApplicationHelper
  def nav_item(link_text, href)
    content_tag(:li) do
      link_to link_text, href
    end
  end

  def page_header(text)
    content_tag(:div, '', class: 'row content') do
      content_tag(:div, '', class: 'span8 text-center') do
        content_tag(:h1, text)
      end
    end
  end
end
