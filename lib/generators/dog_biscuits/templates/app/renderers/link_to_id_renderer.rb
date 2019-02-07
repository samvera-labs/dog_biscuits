# frozen_string_literal: true

class LinkToIdRenderer < Hyrax::Renderers::AttributeRenderer
  
  def attribute_value_to_html(value)
    object = ActiveFedora::Base.find(value)

    link_to(
      "<span class='glyphicon'></span>#{object.first_title}".html_safe,
      "/concern/#{object.class.to_s.pluralize.underscore}/#{value}"
    )
  end
end
