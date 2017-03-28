module LocalAuthorityConcern
  extend ActiveSupport::Concern
  included do
    def initialize
      super
    end

    def include_current_value(value, _index, render_options, html_options)
      unless value.blank?
        html_options[:class] << ' force-select'
        render_options += [[find_value_string(value).join, value]]
      end
      [render_options, html_options]
    end
  end
end