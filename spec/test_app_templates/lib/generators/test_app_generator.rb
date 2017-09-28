# frozen_string_literal: true

require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root './spec/test_app_templates'

  # if you need to generate any additional configuration
  # into the test app, this generator will be run immediately
  # after setting up the application

  # FROM template.rb
  def install_engine
    gem 'hyrax', '2.0.0.beta4'
    run 'bundle install'
    generate 'hyrax:install', '-f'
    rails_command 'db:migrate'
  end

  def create_generic_work
    generate 'hyrax:work GenericWork'
  end

  def install_dog_biscuits
    generate 'dog_biscuits:install', '-f'
  end

  # Currently an old copy of the schema is turning up but I don't know where from
  # Makes no fucking difference: "Solr configuration not found at solr/config. Using ActiveFedora defaults"
  def update_solr_schema
    run 'rm -rf ./solr/conf'
    run 'rm ./solr/config/schema.xml'
    run 'wget https://raw.githubusercontent.com/samvera/hyrax/master/solr/config/schema.xml'
    run 'mv ./schema.xml ./solr/config/'
  end
end
