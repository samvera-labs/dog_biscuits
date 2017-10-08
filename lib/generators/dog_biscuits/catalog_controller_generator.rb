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

  def biscuitify_catalog_controller_facets
    catalog_file = 'app/controllers/catalog_controller.rb'
    DogBiscuits.config.facet_properties.each do |prop|
      injection = "    config.add_facet_field solr_name('#{prop}', :facetable), limit: 5"
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
        injection += "\n"
        inject_into_file catalog_file, before: '    # insert indexes end' do
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
    # Add fields for selected models only
    DogBiscuits.config.selected_models.each do |model|
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

  # TODO remove when fixed in Hyrax
  def add_rights_statement_helper
    helper = "\n\n  # A Blacklight index field helper_method" +
        "\n  # @param [Hash] options from blacklight helper_method invocation. Maps rights URIs to links with labels." +
        "\n  # @return [ActiveSupport::SafeBuffer] rights statement links, " +
        "\n  def rights_statement_links(options)" +
        "\n    service = Hyrax::RightsStatements.new" +
        "\n    options[:value].map { |right| link_to service.label(right), right }.to_sentence.html_safe" +
        "\n  end"
    inject_into_file 'app/helpers/hyrax_helper.rb', after: 'include Hyrax::HyraxHelperBehavior' do
      helper
    end
  end
end