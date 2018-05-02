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

  # Add labels and help_text for the properties for the given model
  # Add everything into the hyrax locale as defaults
  # Then locally people can override in the model files
  def update_hyrax_locale_hints
    locale = 'config/locales/hyrax.en.yml'
    locale_text = File.read('config/locales/hyrax.en.yml')
    append_simple_form_block = "\n  simple_form:\n    hints:\n      defaults:"
    append_simple_form_block += "\n    labels:\n      defaults:"

    append_file locale, append_simple_form_block unless locale_text.include? 'simple_form'

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        next if DogBiscuits.config.property_mappings[prop].blank?

        next if DogBiscuits.config.property_mappings[prop][:help_text].blank?
        prop_key = "#{prop}: "
        hint = DogBiscuits.config.property_mappings[prop][:help_text]
        # match up until the final quote mark
        if locale_text =~ /#{Regexp.escape(prop_key)}"[^"]+"/
          gsub_file locale, /#{Regexp.escape(prop_key)}"[^"]+"/, "#{prop_key}\"#{hint}\""
        else
          inject_into_file locale, after: "\n    hints:\n      defaults:\n" do
            "\n        #{prop_key}\"#{hint}\""
          end
        end
      end
    end
  end

  def update_hyrax_locale_labels
    locale = 'config/locales/hyrax.en.yml'
    locale_text = File.read('config/locales/hyrax.en.yml')

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        next if DogBiscuits.config.property_mappings[prop].blank?

        next if DogBiscuits.config.property_mappings[prop][:label].blank?
        prop_key = "#{prop}: "
        label = DogBiscuits.config.property_mappings[prop][:label]
        # match until the final single quote
        if locale_text =~ /#{Regexp.escape(prop_key)}'[^"]+'/
          gsub_file locale, /#{Regexp.escape(prop_key)}'[^"]+'/, "#{prop_key}#{label}\n"
        else
          inject_into_file locale, after: "\n    labels:\n      defaults:\n" do
            "        #{prop_key}#{label}\n"
          end
        end
      end
    end
  end

  # Add facet, show and index labels for the properties for the given model
  def update_hyrax_locale_blacklight
    locale = 'config/locales/hyrax.en.yml'
    locale_text = File.read('config/locales/hyrax.en.yml')

    inject_blacklight_block = "\n  blacklight:\n    search:\n      fields:"
    inject_blacklight_block += "\n        facet:\n        index:\n        show:\n"

    unless locale_text.include? 'blacklight'
      inject_into_file locale, after: "en:\n" do
        inject_blacklight_block
      end
    end
  end

  # Remove all the values we are going to add
  # Do the 'show'
  def update_hyrax_locale_blacklight_clean_and_show
    locale = 'config/locales/hyrax.en.yml'
    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")
      properties.each do |prop|
        next if DogBiscuits.config.property_mappings[prop].blank?
        next if DogBiscuits.config.property_mappings[prop][:label].blank?
        index_show_key = "          #{prop}_tesim: "
        gsub_file locale, /#{Regexp.escape(index_show_key)}(.*)/, ''
        facet_key = "          #{prop}_sim: "
        gsub_file locale, /#{Regexp.escape(facet_key)}(.*)/, ''
        # Show is before index
        inject_into_file locale, before: '  hyrax:' do
          "          #{prop}_tesim: #{DogBiscuits.config.property_mappings[prop][:label]}\n"
        end
      end
    end
  end

  def update_hyrax_locale_blacklight_facet
    properties = DogBiscuits.config.facet_properties
    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?  
      # Facet is before index
       inject_into_file 'config/locales/hyrax.en.yml', before: '        index:' do
         "          #{prop}_sim: #{DogBiscuits.config.property_mappings[prop][:label]}\n"
       end
    end
  end

  def update_facets
    locale = 'config/locales/hyrax.en.yml'
    locale_text = File.read('config/locales/hyrax.en.yml')
    properties = DogBiscuits.config.facet_only_properties
    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?
      label = DogBiscuits.config.property_mappings[prop][:label]
      facet_key = "          #{prop}_sim: "

      if locale_text.include? facet_key
        gsub_file locale, /#{Regexp.escape(facet_key)}(.*)/, "#{facet_key}#{label}"
      else
        inject_into_file locale, before: '        index:' do
          "#{facet_key}#{label}\n"
        end
      end
    end
  end

  # For reasons I don't understand, this doesn't get written if it is the same as the text
  #  going into the 'show' block, hence adding INDEX at the end and then removing it in the
  #  final method
  def update_hyrax_locale_blacklight_index
    properties = DogBiscuits.config.index_properties

    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?
      # Index is after index
      inject_into_file 'config/locales/hyrax.en.yml', before: '        show:' do
        "          #{prop}_tesim: #{DogBiscuits.config.property_mappings[prop][:label]}INDEX\n"
      end
    end
  end

  def remove_double_line_breaks
    locale = 'config/locales/hyrax.en.yml'
    gsub_file locale, /\n\n/, "\n"
    gsub_file locale, /\n(\s*)\n/, "\n"
    gsub_file locale, /INDEX\n/, "\n" 
  end
end
