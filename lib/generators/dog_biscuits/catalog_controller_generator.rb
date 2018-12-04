# frozen_string_literal: true

class DogBiscuits::CatalogControllerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Creates a new app/controllers/catalog_controller.rb.
  2. Injects facet, show and index fields using confingured properties
       '

  def banner
    say_status("info", "Configuring CatalogController", :blue)
  end

  def create_catalog_controller
    @catalog = 'app/controllers/catalog_controller.rb'
    copy_file 'app/controllers/catalog_controller.rb', @catalog
  end

  # CC file gets overwritten so we'll make sure the Range controller is in place
  def update_range
    catalog_file = File.read(@catalog)
    if DogBiscuits.config.date_range
      gem "blacklight_range_limit"

      Bundler.with_clean_env do
        run "bundle install"
      end
      range = "  include BlacklightRangeLimit::ControllerOverride\n"
      unless catalog_file.include? range
        inject_into_file @catalog, after: "ApplicationController\n" do
          range
        end
      end
    end
  end
end
