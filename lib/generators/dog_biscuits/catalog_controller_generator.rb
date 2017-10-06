# frozen_string_literal: true

class DogBiscuits::CatalogControllerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def banner
    say_status("info", "Configuring CatalogController", :blue)
  end

  def copy
    catalog_file = 'app/controllers/catalog_controller.rb'
    copy_file 'catalog_controller.rb', catalog_file
  end

  # def comment
  #   catalog_file = 'app/controllers/catalog_controller.rb'
  #   comment_lines catalog_file, /config.add_index_field/
  #   comment_lines catalog_file, /config.add_facet_field/
  # end

  def biscuitify_catalog_controller_facets
    catalog_file = 'app/controllers/catalog_controller.rb'
    DogBiscuits.config.facet_properties.each do |prop|
      injection = "    config.add_facet_field solr_name('#{prop}', :facetable), limit: 5\n"
      inject_into_file catalog_file, before: '    # replace facets end' do
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
        injection += "\n"
        inject_into_file catalog_file, before: '    # solr fields to be displayed in the show (single result) view' do
          injection
        end
      end
    end
  end

# def biscuitify_catalog_controller_params
#   catalog_file = 'app/controllers/catalog_controller.rb'
#   fields = DogBiscuits.config.search_fields.collect {|x| "#{x}_tesim"}
#   gsub_file catalog_file, /'title_tesim description_tesim creator_tesim keyword_tesim'/, "'title_tesim description_tesim creator_tesim keyword_tesim #{fields.join(' ')}'"
# end

# we need all fields listed so that they can be searched
  def biscuitify_catalog_controller_show_fields
    catalog_file = 'app/controllers/catalog_controller.rb'
    all_properties = []
    DogBiscuits.config.available_models.each do |model|
      all_properties += DogBiscuits.config.send("#{model.underscore}_properties")
    end
    all_properties -= DogBiscuits.config.base_properties

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