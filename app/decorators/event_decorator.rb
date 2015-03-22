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

  def rsvp
    return nil unless object.rsvp.present?
    content = build_links(object.rsvp)
    content_tag(:p) do
      content_tag(:b, "RSVP: ") + content_tag(:span, content)
    end
  end

  def contact
    return nil unless object.contact.present?
    content = build_links(object.contact)
    content_tag(:p) do
      content_tag(:b, "Contact: ") + content_tag(:span, content)
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
