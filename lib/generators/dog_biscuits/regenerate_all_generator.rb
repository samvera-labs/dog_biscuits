# frozen_string_literal: true

class DogBiscuits::RegenerateAllGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Runs the catalog_controller generator
  2. Runs the attribute_rows generator
  3. Runs the locales generator
  4. Runs the schema_org generator
       '

  def banner
    say_status("info", "Re-generating catalog_controller, locales, attribute_rows and schema_org", :blue)
  end

  def regenerate_catalog_controller
    generate 'dog_biscuits:catalog_controller', '-f'
  end

  def regenerate_locales
    generate 'dog_biscuits:locales', 'All -f'
  end

  def regenerate_attribute_rows
    generate 'dog_biscuits:attribute_rows', 'All -f'
  end

  def regenerate_schema_org
    generate 'dog_biscuits:schema_org', '-f'
  end

end
