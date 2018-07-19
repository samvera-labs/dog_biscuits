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
    append_simple_form_block = "\n  simple_form:\n    hints:\n      defaults:\n"
    append_simple_form_block += "\n    labels:\n      defaults:\n"

    append_file locale, append_simple_form_block unless locale_text.include? 'simple_form'

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")

      properties.each do |prop|
        next if DogBiscuits.config.property_mappings[prop].blank?
        next if DogBiscuits.config.property_mappings[prop][:help_text].blank? && DogBiscuits.config.property_mappings[prop][:label].blank?

        prop_key = "#{prop}: "

        # remove existing lines
        gsub_file locale, /        #{Regexp.escape(prop_key)}[.*]+\n/, '' if locale_text =~ /        #{Regexp.escape(prop_key)}[.*]+\n/

        unless DogBiscuits.config.property_mappings[prop][:help_text].blank?
          hint = DogBiscuits.config.property_mappings[prop][:help_text]
          inject_into_file locale, after: "\n    hints:\n      defaults:\n" do
            "        #{prop_key}\"#{hint}\"\n"
          end
        end
        next if DogBiscuits.config.property_mappings[prop][:label].blank?
        label = DogBiscuits.config.property_mappings[prop][:label]
        inject_into_file locale, after: "\n    labels:\n      defaults:\n" do
          "        #{prop_key}#{label}\n"
        end
      end
    end
  end

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
  def update_hyrax_locale_blacklight_clean_and_update_show
    locale = 'config/locales/hyrax.en.yml'

    # clear facets and index
    gsub_file locale, /        index:(.*)        show:/m, "        index:\n        show:\n"
    gsub_file locale, /        facet:(.*)        index:/m, "        facet:\n        index:\n"

    @models.each do |model|
      properties = DogBiscuits.config.send("#{model}_properties")
      properties.each do |prop|
        next if DogBiscuits.config.property_mappings[prop].blank?
        next if DogBiscuits.config.property_mappings[prop][:label].blank?

        # let's clear out existing property data from show
        index_show_key = "          #{prop}_tesim: "
        gsub_file locale, /#{Regexp.escape(index_show_key)}(.*)/, ''

        inject_into_file locale, after: "        show:\n" do
          "          #{prop}_tesim: #{DogBiscuits.config.property_mappings[prop][:label]}\n"
        end
      end
    end
  end

  def update_hyrax_locale_blacklight_index
    properties = DogBiscuits.config.index_properties
    locale = 'config/locales/hyrax.en.yml'
    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?

      inject_into_file locale, after: "        index:\n" do
        "          #{prop}_tesim: #{DogBiscuits.config.property_mappings[prop][:label]}INDEX\n"
      end
    end
  end

  def update_hyrax_locale_blacklight_facet
    properties = DogBiscuits.config.facet_properties
    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?

      inject_into_file 'config/locales/hyrax.en.yml', after: "        facet:\n" do
        "          #{prop}_sim: #{DogBiscuits.config.property_mappings[prop][:label]}\n"
      end
    end
  end

  def update_hyrax_locale_blacklight_facet_only
    locale = 'config/locales/hyrax.en.yml'
    properties = DogBiscuits.config.facet_only_properties
    properties.each do |prop|
      next if DogBiscuits.config.property_mappings[prop].blank?
      next if DogBiscuits.config.property_mappings[prop][:label].blank?
      label = DogBiscuits.config.property_mappings[prop][:label]
      inject_into_file locale, after: "        facet:\n" do
        "          #{prop}_sim: #{label}\n"
      end
    end
    if DogBiscuits.config.date_range && !DogBiscuits.config.property_mappings[:date_range][:label].blank?
      inject_into_file locale, after: "        facet:\n" do
        "          date_range_sim: #{DogBiscuits.config.property_mappings[:date_range][:label]}\n"
      end
    end
  end

  def remove_double_line_breaks
    locale = 'config/locales/hyrax.en.yml'
    gsub_file locale, /\n\n/, "\n"
    gsub_file locale, /\n(\s*)\n/, "\n"
    gsub_file locale, /INDEX\n/, "\n"
    append_file locale, "\n\n"
  end
end
