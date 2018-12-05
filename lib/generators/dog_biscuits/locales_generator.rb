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

  def create_dog_biscuits_locale
    template('dog_biscuits.en.yml.erb', 'config/locales/dog_biscuits.en.yml')
  end
end
