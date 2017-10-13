# frozen_string_literal: true

class DogBiscuits::CatalogControllerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  # Generate the catalog controller based on configured properties

  def banner
    say_status("info", "Configuring CatalogController", :blue)
  end

  def copy_catalog
    catalog_file = 'app/controllers/catalog_controller.rb'
    copy_file 'catalog_controller.rb', catalog_file
  end

  def biscuitify_catalog_controller_facets
    catalog_file = 'app/controllers/catalog_controller.rb'

    DogBiscuits.config.facet_properties.each do |prop|

      injection = "    config.add_facet_field solr_name('#{prop.to_s}', :facetable), limit: 5"

      if DogBiscuits.config.property_mappings[prop]
        if DogBiscuits.config.property_mappings[prop][:label]
          injection += ", label: '#{DogBiscuits.config.property_mappings[prop][:label]}'"
        end
      end

      injection += "\n"

      inject_into_file catalog_file, before: "    # replace facets end" do
        injection
      end unless catalog_file.include? injection
    end
  end

  def biscuitify_catalog_controller_index
    catalog_file = 'app/controllers/catalog_controller.rb'

    DogBiscuits.config.index_properties.each do |prop|

      if DogBiscuits.config.property_mappings[prop]
        injection = "    config.add_index_field solr_name"
        injection += DogBiscuits.config.property_mappings[prop][:index]

        if DogBiscuits.config.property_mappings[prop][:schema_org]
          injection += ", itemprop:  '#{DogBiscuits.config.property_mappings[prop][:schema_org][:property]}'"
        end

        if DogBiscuits.config.property_mappings[prop][:label]
          injection += ", label:  '#{DogBiscuits.config.property_mappings[prop][:label]}'"
        end

        if DogBiscuits.config.property_mappings[prop][:helper_method]
          injection += ", helper_method:  '#{DogBiscuits.config.property_mappings[prop][:helper_method]}'"
        end

        injection += "\n"

        inject_into_file catalog_file, before: '    # insert indexes end' do
          injection
        end
      end
    end

    # This is a local property in Hyku
    extent = "    # For Hyku\n    config.add_index_field solr_name('extent', :stored_searchable)"
    inject_into_file catalog_file, before: '    # insert indexes end' do
      extent
    end
  end

  # All fields need to be added to the show list as these are used decide what is searched
  def biscuitify_catalog_controller_show_fields
    catalog_file = 'app/controllers/catalog_controller.rb'
    all_properties = []
    # Add fields for selected models only
    models = DogBiscuits.config.selected_models.collect {|m| m.underscore}
    models.each do |model|
      all_properties += DogBiscuits.config.send("#{model.underscore}_properties")
    end
    # Basic Metadata properties are already there
    all_properties -= DogBiscuits.config.base_properties

    # Special contributor field that isn't included in the model properties list
    all_properties << :contributor_combined

    # This is a local property in Hyku
    all_properties << :extent

    all_properties.uniq.sort.each do |prop|
      injection = "    config.add_show_field solr_name('#{prop}', :stored_searchable)\n"
      inject_into_file catalog_file, before: '    # "fielded" search configuration' do
        injection
      end unless catalog_file.include? injection
    end

    all_properties.uniq.sort.each do |prop|
      injection = "      config.add_search_field('#{prop}') do |field|\n" +
          "        solr_name = solr_name('#{prop}', :stored_searchable)\n" +
          "        field.solr_local_parameters = {\n" +
          "          qf: solr_name,\n" +
          "          pf: solr_name\n" +
          "        }\n" +
          "      end\n" +
          "\n"

      inject_into_file catalog_file, before: '    # "sort results by" select (pulldown)' do
        injection
      end unless catalog_file.include? injection
    end
  end
end