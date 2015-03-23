class EventDecorator < Draper::Decorator
  PHONE_NUMBER_REGEX = /\d{3}-\d{3}-\d{4}/
  include Draper::LazyHelpers
  delegate_all

  def address
    object.address.gsub(/[\r\n]+/, "<br />").html_safe
  end

  def date_and_title
    [object.date.strftime("%B %d, %Y"), object.title].join(" - ")
  end

  def rsvp(show_title: true)
    return nil unless object.rsvp.present?
    content = content_tag(:span, build_links(object.rsvp))
    if show_title
      content_tag(:p) do
        content_tag(:b, "RSVP: ") + content
      end
    else
      content_tag(:p, content)
    end
  end

  def contact(show_title: true)
    return nil unless object.contact.present?
    content = content_tag(:span, build_links(object.contact))
    if show_title
      content_tag(:p) do
        content_tag(:b, "Contact: ") + content
      end
    else
      content_tag(:p, content)
    end
  end

  def build_links(content)
    content = content.gsub(/\b\S+@\S+\b/) do |m|
      content_tag(:a, m, href: "mailto:#{m}")
    end
    content = content.gsub(PHONE_NUMBER_REGEX) do |phone_number|
      content_tag(:a, phone_number, href: "javascript:;")
    end
    content = content.gsub(/\bhttp\S*/) do |url|
      content_tag(:a, url, href: url, target: "_blank")
    end
    content.html_safe
  end
end
