# frozen_string_literal: true

class PackagedByIdsRenderer < Hyrax::Renderers::AttributeRenderer
  # Render the bibilionumber as a link to the King's Fund Library Catalogue record
  def attribute_value_to_html(value)
    link_to(
      "<span class='glyphicon'></span>#{Package.find(value).first_title}".html_safe,
      "/concern/packages/#{value}"
    )
  end
end
