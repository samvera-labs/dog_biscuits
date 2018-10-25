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

  def copy_schema_org
    copy_file 'config/schema_org.yml', 'config/schema_org.yml'
  end

  def schema_org
    schema_file = 'config/schema_org.yml'

    all_properties = []

    @models = DogBiscuits.config.selected_models.collect(&:underscore)

    @models.each do |model|
      all_properties += DogBiscuits.config.send("#{model.underscore}_properties")
    end
    # Basic Metadata properties have already been added in Hyrax
    all_properties -= DogBiscuits.config.base_properties

    all_properties.uniq.sort.each do |prop|
      string_prop = prop.to_s
      injection = ''

      if DogBiscuits.config.property_mappings[prop] && DogBiscuits.config.property_mappings[prop][:schema_org]
        injection += "\n  #{string_prop}:"
        DogBiscuits.config.property_mappings[prop][:schema_org].each do |k, v|
          injection += "\n    #{k}: '#{v}'"
        end
      end

      next if injection.blank?
      inject_into_file schema_file, after: 'schema_org:' do
        injection.to_s
      end
    end
  end
end
