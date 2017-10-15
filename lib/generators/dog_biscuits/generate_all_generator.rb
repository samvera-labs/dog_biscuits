# frozen_string_literal: true

class DogBiscuits::GenerateAllGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Runs the work generator for all selected models
  2. Runs the catalog_controller generator
  3. Runs the attribute_rows generator
  4. Runs the locales generator
  5. Runs the schema_org generator
       '

  class_option :skip_model, type: :boolean, default: false

  def banner
    say_status("info", "Re-generating catalog_controller, locales, attribute_rows and schema_org", :blue)
  end

  def generate_catalog_controller
    generate 'dog_biscuits:catalog_controller', '-f'
  end

  def generate_locales
    generate 'dog_biscuits:locales', 'All -f'
  end

  def generate_attribute_rows
    generate 'dog_biscuits:attribute_rows', 'All -f'
  end

  def generate_schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

  def generate_works
    DogBiscuits.config.selected_models.each do | model |
      if options[:skip_model]
        generate 'dog_biscuits:work', "#{model} --skip_model -f"
      else
        generate 'dog_biscuits:work', "#{model} -f"
      end
    end
  end

end
