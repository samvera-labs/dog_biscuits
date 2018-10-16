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
    copy_file 'catalog_controller.rb', @catalog
    @catalog_file = File.read(@catalog)
  end

  # CC file gets overwritten so we'll make sure the Range controller is in place
  def update_range
    if DogBiscuits.config.date_range
      gem "blacklight_range_limit"

      Bundler.with_clean_env do
        run "bundle install"
      end
      range = "  include BlacklightRangeLimit::ControllerOverride\n"
      unless @catalog_file.include? range
        inject_into_file @catalog, after: "ApplicationController\n" do
          range
        end
      end
    end
  end

  def update_catalog_controller_facets
    DogBiscuits.config.facet_properties.each do |prop|
      injection = "    config.add_facet_field solr_name('#{prop}', :facetable), limit: 5"

      if DogBiscuits.config.property_mappings[prop]
        injection += ", label: '#{DogBiscuits.config.property_mappings[prop][:label]}'" if DogBiscuits.config.property_mappings[prop][:label]
        # injection += ", helper_method:  '#{DogBiscuits.config.property_mappings[prop][:helper_method]}'" if DogBiscuits.config.property_mappings[prop][:helper_method]
      end

      injection += "\n"

      next if @catalog_file.include? injection
      inject_into_file @catalog, before: "    # replace facets end" do
        injection
      end
    end
  end

  def update_catalog_controller_index
    DogBiscuits.config.index_properties.each do |prop|
      next unless DogBiscuits.config.property_mappings[prop]
      next unless DogBiscuits.config.property_mappings[prop][:index] # skip if there isn't an index mapping
      injection = "    config.add_index_field solr_name"
      injection += DogBiscuits.config.property_mappings[prop][:index]

      injection += ", itemprop:  '#{DogBiscuits.config.property_mappings[prop][:schema_org][:property]}'" if DogBiscuits.config.property_mappings[prop][:schema_org]

      injection += ", label:  '#{DogBiscuits.config.property_mappings[prop][:label]}'" if DogBiscuits.config.property_mappings[prop][:label]

      injection += ", helper_method:  '#{DogBiscuits.config.property_mappings[prop][:helper_method]}'" if DogBiscuits.config.property_mappings[prop][:helper_method]

      injection += "\n"

      inject_into_file @catalog, before: '    # insert indexes end' do
        injection
      end
    end

    # This is a local property in Hyku
    extent = "    # For Hyku\n    config.add_index_field solr_name('extent', :stored_searchable)"
    if File.exist?('config/initializers/version.rb') && File.read('config/initializers/version.rb').include?('Hyku')
      inject_into_file @catalog, before: '    # insert indexes end' do
        extent
      end
    end
  end

  # All fields need to be added to the show list as these are used decide what is searched
  def update_catalog_controller_show_fields
    @catalog_file = 'app/controllers/catalog_controller.rb'
    all_properties = []
    # Add fields for selected models only
    models = DogBiscuits.config.selected_models.collect(&:underscore)
    models.each do |model|
      all_properties += DogBiscuits.config.send("#{model.underscore}_properties")
    end
    # Basic Metadata properties are already there
    all_properties -= DogBiscuits.config.base_properties

    # Special contributor field that isn't included in the model properties list
    all_properties << :contributor_combined

    # This is a local property in Hyku
    all_properties << :extent if File.exist?('config/initializers/version.rb') && File.read('config/initializers/version.rb').include?('Hyku')

    all_properties.uniq.sort.each do |prop|
      injection = "    config.add_show_field solr_name('#{prop}', :stored_searchable)\n"
      next if @catalog_file.include? injection
      inject_into_file @catalog, before: '    # "fielded" search configuration' do
        injection
      end
    end

    all_properties.uniq.sort.each do |prop|
      injection = "      config.add_search_field('#{prop}') do |field|\n" \
                  "        solr_name = solr_name('#{prop}', :stored_searchable)\n" \
                  "        field.solr_local_parameters = {\n" \
                  "          qf: solr_name,\n" \
                  "          pf: solr_name\n" \
                  "        }\n" \
                  "      end\n" \
                  "\n"

      next if @catalog_file.include? injection
      inject_into_file @catalog, before: '    # "sort results by" select (pulldown)' do
        injection
      end
    end
  end
end
