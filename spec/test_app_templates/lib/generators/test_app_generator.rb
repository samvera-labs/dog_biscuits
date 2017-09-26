# frozen_string_literal: true

require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root './spec/test_app_templates'

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  def install_engine
    generate 'hyrax:install', '-f'
    # rails_command 'hyrax:workflow:load'
  end

  def create_generic_work
    generate 'hyrax:work GenericWork'
  end

  def install_dog_biscuits
    generate 'dog_biscuits:install', '-f'
  end
end
