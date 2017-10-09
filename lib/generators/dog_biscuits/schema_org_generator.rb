# frozen_string_literal: true

class DogBiscuits::SchemaOrgGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Generating schema_org.yml", :blue)
  end

  def copy_schema_org
    copy_file 'config/schema_org.yml', 'config/schema_org.yml'
  end

  def schema_org
    schema_file = 'config/schema_org.yml'

    all_properties = []
    DogBiscuits.config.available_models.each do |model|
      all_properties += DogBiscuits.config.send("#{model.underscore}_properties")
    end
    all_properties -= DogBiscuits.config.base_properties

    all_properties.uniq.sort.each do |prop|
      string_prop = prop.to_s
      injection = ''
      if DogBiscuits.config.property_mappings[prop] && DogBiscuits.config.property_mappings[prop][:schema_org]
        injection += "\n  #{string_prop}:"
        DogBiscuits.config.property_mappings[prop][:schema_org].each do |k, v|
          injection += "\n    #{k.to_s}: '#{v}'"
        end
      end
      inject_into_file schema_file, after: 'schema_org:' do
        "#{injection}"
      end unless injection.blank?
    end
  end
end