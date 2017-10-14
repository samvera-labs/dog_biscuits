# frozen_string_literal: true

class DogBiscuits::LocalesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator can be run for an existing Model, or for All models (with All).
This generator makes the following changes to your application
  where information is available in property_mappings:
    1. Injects labels and help_text into the en locale for the given model.
    2. Injects new labels into the en blacklight locale.
       '

  def banner
    say_status("info", "Generating locales for #{class_name}", :blue)

    if class_name == 'All'
      @models = DogBiscuits.config.selected_models.map {|m| m.underscore}
    else
      if DogBiscuits.config.selected_models.include? class_name
        @models = [class_name.underscore]
      else
        say_status("error", "UNSUPPORTED MODEL. SUPPORTED MODELS ARE: #{DogBiscuits.config.available_models.collect {|m| m}.join(', ') }", :red)
        exit 0
      end
    end
  end

  # Add labels and help_text for the properties for the given model
  def update_locales
    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")
      append_simple_form_block = "\n  simple_form:\n    hints:"
      append_simple_form_block += "\n    defaults:"

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop]
          if DogBiscuits.config.property_mappings[prop][:help_text]
            append_simple_form_block += "\n      #{prop}: '#{DogBiscuits.config.property_mappings[prop][:help_text]}'"
          end
        end
      end
      append_simple_form_block += "\n    labels:"

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop]
          if DogBiscuits.config.property_mappings[prop][:label]
            label = DogBiscuits.config.property_mappings[prop][:label]
            append_simple_form_block += "\n      #{prop}: '#{label}'"
          end
        end
      end

      locale = "config/locales/#{model.underscore}.en.yml"
      append_file locale, append_simple_form_block
    end
  end

  # Set-up the blacklight file. Ensure it has the right structure to add labels.
  def setup_blacklight_locale
    locale = "config/locales/blacklight.en.yml"

    unless locale.include? '    search:'
      append_file locale, "\n    search:"
    end
    unless locale.include? '      fields:'
      append_file locale, "\n      fields:"
    end
    unless locale.include? '         facet:'
      append_file locale, "\n        facet:"
      append_file locale, "\n          human_readable_type_sim: Type"
    end
    unless locale.include? '        index:'
      append_file locale, "\n        index:"
      append_file locale, "\n          human_readable_type_sim: Type"
    end
    unless locale.include? '        show:'
      append_file locale, "\n        show:"
    end
  end

  # Add facet, show and index labels for the properties for the given model
  def update_blacklight_locale
    locale = "config/locales/blacklight.en.yml"

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop]
          if DogBiscuits.config.property_mappings[prop][:label]
            label = DogBiscuits.config.property_mappings[prop][:label]
            append_string = "          #{prop.to_s}_tesim: #{label}"
            facet_string = "          #{prop.to_s}_sim: #{label}"

            # Facets
            inject_into_file locale, before: '        index:' do
              "#{facet_string}\n"
            end if DogBiscuits.config.facet_properties.include? prop and !locale.include? facet_string
            # Index
            inject_into_file locale, before: '        show:' do
              "#{append_string}\n"
            end if DogBiscuits.config.index_properties.include? prop and !locale.include? append_string
            # Show
            append_file locale, "\n#{append_string}" unless locale.include? append_string
          end
        end
      end
    end
  end

  def update_facets
    locale = "config/locales/blacklight.en.yml"
    properties = DogBiscuits.config.facet_only_properties
    properties.each do |prop|
      if DogBiscuits.config.property_mappings[prop]
        if DogBiscuits.config.property_mappings[prop][:label]
          label = DogBiscuits.config.property_mappings[prop][:label]
          facet_string = "          #{prop.to_s}_sim: #{label}"

          # Facets
          inject_into_file locale, before: '        index:' do
            "#{facet_string}\n"
          end if DogBiscuits.config.facet_properties.include? prop and !locale.include? facet_string
        end
      end
    end
  end
end
