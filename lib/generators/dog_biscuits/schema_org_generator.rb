# frozen_string_literal: true

class DogBiscuits::SchemaOrgGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Creates a schema_org.yml file in ./config
  2. Injects schema_org metadata for all properties
    where this information is configured in property_mappings
       '

  def banner
    say_status("info", "Generating schema_org.yml", :blue)
  end

  def create_actor
    template('schema_org.yml.erb', 'config/schema_org.yml')
  end
end
