# frozen_string_literal: true

class DogBiscuits::GenerateAllGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Runs the work generator for selected models configured in `config/initializers/dog_biscuits.rb`
  2. Runs the catalog_controller generator
  3. Runs the locales generator
  4. Runs the schema_org generator
       '

  class_option :skipmodel, type: :boolean, default: false

  def banner
    say_status("info", "Re-generating catalog_controller, locales, attribute_rows and schema_org", :blue)
  end
  
  def create_indexers
    directory 'app/indexers', 'app/indexers'
  end

  def generate_works
    DogBiscuits.config.selected_models.each do |model|
      if options[:skipmodel]
        generate 'dog_biscuits:work', "#{model} --skipmodel -f"
      else
        generate 'dog_biscuits:work', "#{model} -f"
      end
    end
  end
end
