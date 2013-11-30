module ApplicationHelper
  def napgcm_cert_url
    'http://www.caremanager.org/why-care-management/certification-professional-conduct/'
  end

  def brochure_link
    link_to "Click here for Jessica's brochure", asset_path('JessicaRoweElderCareConsulting.pdf'), target: :blank
  end

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
