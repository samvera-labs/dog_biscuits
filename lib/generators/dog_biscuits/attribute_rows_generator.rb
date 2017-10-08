# frozen_string_literal: true

class DogBiscuits::AttributeRowsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Generating _attribute_rows.html.erb", :blue)
  end

  def attribute_rows
    DogBiscuits.config.selected_models.each do |model|
      attributes_file = "app/views/hyrax/#{model.underscore.pluralize}/_attribute_rows.html.erb"
      copy_file '_attribute_rows.html.erb', attributes_file

      DogBiscuits.config.send("#{model.underscore}_properties").each do |term|
        # Append _label onto any controlled properties
        injection = "\n<%= presenter.attribute_to_html(:#{term}"
        if "#{model.camelize}".constantize.controlled_properties.include? term
          injection += "_label"
        end
        if term.to_s.include? 'url'
          injection += ", render_as: :external_link"
        elsif DogBiscuits.config.facet_properties.include? term
          injection += ", render_as: :faceted"
        end
        if DogBiscuits.config.property_mappings[term]
          if DogBiscuits.config.property_mappings[term][:label]
            injection += ", label: '#{DogBiscuits.config.property_mappings[term][:label]}'"
          end
        end
        injection += ") %>"

        inject_into_file attributes_file, after: '<%#= display fields for show page %>' do
          injection unless attributes_file.include? injection
        end
      end
    end
  end
end
