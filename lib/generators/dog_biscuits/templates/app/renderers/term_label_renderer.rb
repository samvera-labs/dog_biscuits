# frozen_string_literal: true
class TermLabelRenderer < Hyrax::Renderers::AttributeRenderer
  include DogBiscuitsHelper

    private

      def li_value(value)
        link_to(ERB::Util.h(term_label(value)), search_path(value))
      end
      
      def search_path(value)
        Rails.application.routes.url_helpers.search_catalog_path(
          "f[#{field}_sim][]": ERB::Util.h(value), locale: I18n.locale
        )
      end
end
