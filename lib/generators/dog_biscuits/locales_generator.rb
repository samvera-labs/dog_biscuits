# frozen_string_literal: true

class DogBiscuits::LocalesGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator can be run for an existing Model, or for All models (with All).
This generator makes the following changes to your application
  where information is available in property_mappings:
    1. Injects labels and help_text into the en locales.
       '

  def banner
    say_status("info", "Generating locales", :blue)
  end

  # Remove all blacklight labels from hyrax locales; we're going to re-add them below
  def wipe_from_hyrax_locales
    Dir.entries('config/locales').select { |file| file.start_with?('hyrax.') }.each do |locale|
      gsub_file "config/locales/#{locale}", /        index:(.*)        show:/m, "        index:\n        show:"
      gsub_file "config/locales/#{locale}", /        facet:(.*)        index:/m, "        facet:\n        index:"
      gsub_file "config/locales/#{locale}", /        show:(.*)  hyrax:/m, "        show:\n  hyrax:"
    end
  end

  # @todo internationalization
  def create_hyrax_metadata_locale
    template('hyrax_metadata.en.yml.erb', 'config/locales/hyrax_metadata.en.yml')
  end
end
