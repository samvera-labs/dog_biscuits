# frozen_string_literal: true

class DogBiscuits::LocalesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator can be run for an existing Model, or for All models (with All).
This generator makes the following changes to your application
  where information is available in property_mappings:
    1. Injects labels and help_text into the en en hyrax locale.
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
  # Add everything into the hyrax locale as defaults
  # Then locally people can override in the model files
  def update_hyrax_locale_hints
    locale = "config/locales/hyrax.en.yml"
    locale_text = File.read("config/locales/hyrax.en.yml")
    append_simple_form_block = "\n  simple_form:\n    hints:\n      defaults:"
    append_simple_form_block += "\n    labels:\n      defaults:"

    unless locale_text.include? 'simple_form'
      append_file locale, append_simple_form_block
    end

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop].present?

          if DogBiscuits.config.property_mappings[prop][:help_text].present?
            prop_key = "#{prop.to_s}: "
            hint = DogBiscuits.config.property_mappings[prop][:help_text]
            # match up until the final quote mark
            if locale_text =~ /#{Regexp.escape(prop_key)}"[^"]+"/
              gsub_file locale, /#{Regexp.escape(prop_key)}"[^"]+"/, "#{prop_key}\"#{hint}\""
            else
              inject_into_file locale, before: "\n    labels:" do
                "\n        #{prop_key}\"#{hint}\""
              end
            end
          end
        end
      end
    end
  end

  def update_hyrax_locale_labels
    locale = "config/locales/hyrax.en.yml"
    locale_text = File.read("config/locales/hyrax.en.yml")

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop].present?

          if DogBiscuits.config.property_mappings[prop][:label].present?
            prop_key = "#{prop.to_s}: "
            label = DogBiscuits.config.property_mappings[prop][:label]
            # do not match line ends otherwise it will replace to the end of the file
            if locale_text =~ /#{Regexp.escape(prop_key)}[^"\n]+/
              gsub_file locale, /#{Regexp.escape(prop_key)}[^"\n]+/, "#{prop_key}#{label}\n"
            else
              append_file locale, "\n        #{prop_key}#{label}\n"
            end
          end
        end
      end
    end
  end

  # Add facet, show and index labels for the properties for the given model
  def update_hyrax_locale_blacklight
    locale = "config/locales/hyrax.en.yml"
    locale_text = File.read("config/locales/hyrax.en.yml")

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        if DogBiscuits.config.property_mappings[prop].present?
          if DogBiscuits.config.property_mappings[prop][:label].present?
            label = DogBiscuits.config.property_mappings[prop][:label]
            append_key = "          #{prop.to_s}_tesim: "
            facet_key = "          #{prop.to_s}_sim: "

            # Facets
            if DogBiscuits.config.facet_properties.include? prop
              if locale_text.include? facet_key
                gsub_file locale, /#{Regexp.escape(facet_key)}(.*)/, "#{facet_key}#{label}"
              else
                inject_into_file locale, before: '        index:' do
                  "#{facet_key}#{label}\n"
                end
              end
            end
            # Index
            if DogBiscuits.config.index_properties.include? prop
              if locale_text.include? append_key
                gsub_file locale, /#{Regexp.escape(append_key)}(.*)/, "#{append_key}#{label}"
              else
                inject_into_file locale, before: '        show:' do
                  "#{append_key}#{label}\n"
                end
              end
            end
            # Show
            if locale_text.include? append_key
              gsub_file locale, /#{Regexp.escape(append_key)}(.*)/, "#{append_key}#{label}"
            else
              inject_into_file locale, before: '  hyrax:' do
                "#{append_key}#{label}\n"
              end
            end
          end
        end
      end
    end
  end

  def update_facets
    locale = "config/locales/hyrax.en.yml"
    locale_text = File.read("config/locales/hyrax.en.yml")
    properties = DogBiscuits.config.facet_only_properties
    properties.each do |prop|
      if DogBiscuits.config.property_mappings[prop].present?
        if DogBiscuits.config.property_mappings[prop][:label].present?
          label = DogBiscuits.config.property_mappings[prop][:label]
          facet_key = "          #{prop.to_s}_sim: "

          if locale_text.include? facet_key
            gsub_file locale, /#{Regexp.escape(facet_key)}(.*)/, "#{facet_key}#{label}"
          else
            inject_into_file locale, before: '        index:' do
              "#{facet_key}#{label}\n"
            end
          end
        end
      end
    end
  end

  def remove_double_line_breaks
    locale = "config/locales/hyrax.en.yml"
    gsub_file locale, /\n\n/, "\n"
    gsub_file locale, /\n(\s*)\n/, "\n"
  end
end
