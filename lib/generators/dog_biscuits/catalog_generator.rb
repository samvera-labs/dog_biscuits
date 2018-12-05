# frozen_string_literal: true

class DogBiscuits::CatalogGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
         1. Adds a new catalog_controller.rb
       '

  def banner
    say_status("info", "Generating catalog_controller.rb", :blue)
  end

  def create_catalog
    copy_file 'app/controllers/catalog_controller.rb', 'app/controllers/catalog_controller.rb'
  end
end
