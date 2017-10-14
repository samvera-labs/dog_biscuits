# frozen_string_literal: true

class DogBiscuits::AttributeRowsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator can be run for an existing Model, or for All models (with All).
This generator makes the following changes to your application:
  1. Creates an _attribute_rows.html.erb file for the given Work
  2. Injects a row for each attribute where information is available in property_mappings
      '

  def banner
    say_status("info", "Generating _attribute_rows.html.erb for #{class_name}", :blue)

    if class_name == 'All'
      @models = DogBiscuits.config.selected_models.map {|m| m.underscore}
    else
      if DogBiscuits.config.selected_models.include? class_name
        @models = [ class_name.underscore ]
      else
        say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect {|m| m}.join(', ') }", :red)
        exit 0
      end
    end
  end

  # Add a line for each property for the given model
  #  eg. <%= presenter.attribute_to_html(:editor) %>
  def attribute_rows
    @models.each do |model|
      attributes_file = "app/views/hyrax/#{model.underscore.pluralize}/_attribute_rows.html.erb"
      copy_file '_attribute_rows.html.erb', attributes_file

      DogBiscuits.config.send("#{model.underscore}_properties").each do |term|
        # Some attributes are included outside of the _attribute_rows.html.erb
        #   add them in for completeness, but commented out
        case term
          when :title
            injection = "\n<%#= presenter.attribute_to_html(:#{term}"
          when :description
            injection = "\n<%#= presenter.attribute_to_html(:#{term}"
          when :license
            injection = "\n<%#= presenter.attribute_to_html(:#{term}"
          else
            injection = "\n<%= presenter.attribute_to_html(:#{term}"
        end

        # Append _label onto any controlled properties
        if "#{model.camelize}".constantize.controlled_properties.include? term
          injection += "_label"
        end

        if DogBiscuits.config.facet_properties.include? term
          injection += ", render_as: :faceted"
        end

        if DogBiscuits.config.property_mappings[term]
          if DogBiscuits.config.property_mappings[term][:label]
            injection += ", label: '#{DogBiscuits.config.property_mappings[term][:label]}'"
          end
          if DogBiscuits.config.property_mappings[term][:render_as]
            injection += ", render_as: :#{DogBiscuits.config.property_mappings[term][:render_as]}"
          end
        end
        injection += ") %>"

        append_file attributes_file, injection
      end
    end
  end
end
