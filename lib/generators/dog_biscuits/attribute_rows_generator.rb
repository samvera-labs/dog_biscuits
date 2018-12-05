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
      @models = DogBiscuits.config.selected_models.map(&:underscore)
    else
      if DogBiscuits.config.selected_models.include? class_name
        @models = [class_name.underscore]
      else
        say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect { |m| m }.join(', ')}", :red)
        exit 0
      end
    end
  end

  # Add a line for each property for the given model
  #  eg. <%= presenter.attribute_to_html(:editor) %>
  def attribute_rows
    @models.each do |model|
      @model = model
      attributes_file = "app/views/hyrax/#{model.underscore.pluralize}/_attribute_rows.html.erb"
      copy_file '_attribute_rows.html.erb', attributes_file
    end
  end
end
