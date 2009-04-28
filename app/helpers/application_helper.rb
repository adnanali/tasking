# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    error_class = "fieldWithErrors"
    if html_tag =~ /<(label|input|textarea|select)[^>]+class=/
      class_attribute = html_tag =~ /class=['"]/
      html_tag.insert(class_attribute + 7, "#{error_class} ")
    elsif html_tag =~ /<(label|input|textarea|select)/
      first_whitespace = html_tag =~ /\s/
      html_tag[first_whitespace] = " class='#{error_class}' "
    end
    html_tag
  end

  def mmarkdown(ptext)
    text = ptext

    #mtext = RDiscount.new(text)
    #text = mtext.to_html

    text = textilize(text)

    text 
  end
end
