# frozen_string_literal: true

module LocalAuthorityConcern
  extend ActiveSupport::Concern
  included do
    def initialize
      super
    end

    def include_current_label(value, _index, render_options, html_options)
      if value.present?
        html_options[:class] << ' force-select'
        render_options += [[find_label_string(value).join, value]]
      end
      [render_options, html_options]
    end
  end
end
