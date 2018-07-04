# frozen_string_literal: true
class CatalogController < ApplicationController
  include Hydra::Catalog
  include Hydra::Controller::ControllerBehavior

  # This filter applies the hydra access controls
  before_action :enforce_show_permissions, only: :show

  def self.uploaded_field
    solr_name('system_create', :stored_sortable, type: :date)
  end

  def self.modified_field
    solr_name('system_modified', :stored_sortable, type: :date)
  end

  configure_blacklight do |config|
    config.view.gallery.partials = [:index_header, :index]
    config.view.masonry.partials = [:index]
    config.view.slideshow.partials = [:index]

    config.show.tile_source_field = :content_metadata_image_iiif_info_ssm
    config.show.partials.insert(1, :openseadragon)
    # default advanced config values
    config.advanced_search ||= Blacklight::OpenStructWithHashAccess.new
    # config.advanced_search[:qt] ||= 'advanced'
    config.advanced_search[:url_key] ||= 'advanced'
    config.advanced_search[:query_parser] ||= 'dismax'
    config.advanced_search[:form_solr_parameters] ||= {}

    config.search_builder_class = Hyrax::CatalogSearchBuilder

    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.default_solr_params = {
      qt: "search",
      rows: 10,
      qf: "title_tesim description_tesim creator_tesim keyword_tesim"
    }

    # Specify which field to use in the tag cloud on the homepage.
    # To disable the tag cloud, comment out this line.
    config.tag_cloud_field_name = Solrizer.solr_name("keyword", :facetable)

    # solr field configuration for document/show views
    config.index.title_field = solr_name("title", :stored_searchable)
    config.index.display_type_field = solr_name("has_model", :symbol)
    config.index.thumbnail_field = 'thumbnail_path_ss'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    
    # replace facets start
    DogBiscuits.config.facet_properties.each do |facet|
      # TODO: create helper - get labels from locales?
      if DogBiscuits.config.property_mappings[facet]
        label = if DogBiscuits.config.property_mappings[facet][:label]
                  DogBiscuits.config.property_mappings[facet][:label]
                else
                  facet.to_s.capitalize
                end
        # TODO: create helper
        render = (DogBiscuits.config.property_mappings[facet][:render_as] if DogBiscuits.config.property_mappings[facet][:render_as])
    end
      config.add_facet_field solr_name(
        facet.to_s, :facetable
        ), helper_method: helper_method, 
        label: label, 
        limit: 5
    end
    # replace facets end

    config.add_facet_field solr_name("file_format", :facetable), limit: 5, label: 'File format'
    config.add_facet_field solr_name('member_of_collections', :symbol), limit: 5, label: 'Collection'

    # The generic_type isn't displayed on the facet list
    # It's used to give a label to the filter that comes from the user profile
    config.add_facet_field solr_name("generic_type", :facetable), if: false

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display

    # insert indexes start
    DogBiscuits.config.index_properties.each do |index|
      # TODO: create helper / use locale / shouldn't locale get used anyway?
      if DogBiscuits.config.property_mappings[index]
        label = if DogBiscuits.config.property_mappings[index][:label]
                  DogBiscuits.config.property_mappings[index][:label]
                else
                  index.to_s.capitalize
                end
        # TODO: create helpers
        # TODO: get itemprop from Schema.org
        item_prop = DogBiscuits.config.property_mappings[prop][:schema_org][:property] if DogBiscuits.config.property_mappings[prop][:schema_org]
        helper_method = (DogBiscuits.config.property_mappings[index][:helper_method] if DogBiscuits.config.property_mappings[index][:helper_method])
    end

      # TODO break up the index property into: index_as, type
      config.add_index_field solr_name(index.to_s,
          DogBiscuits.config.property_mappings[prop][:index][:as],
          DogBiscuits.config.property_mappings[prop][:index][:type] 
        ), 
        itemprop: itemprop, 
        label: label, 
        helper_method: helper_method
    end
    # insert indexes end

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    # TODO - replace this
    # needs all properties method
    DogBiscuits.all_properties.each do | prop |
      config.add_show_field solr_name(prop.to_s, :stored_searchable)
    end

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.
    #
    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.
    config.add_search_field('all_fields', label: 'All Fields') do |field|
      all_names = config.show_fields.values.map(&:field).join(" ")
      title_name = solr_name("title", :stored_searchable)
      field.solr_parameters = {
        qf: "#{all_names} file_format_tesim all_text_timv",
        pf: title_name.to_s
      }
    end

    # TODO all properties config
    DogBiscuits.all_properties.each do | prop |
      # Now we see how to over-ride Solr request handler defaults, in this
      # case for a BL "search field", which is really a dismax aggregate
      # of Solr search fields.
      config.add_search_field(prop.to_s) do |field|
        # solr_parameters hash are sent to Solr as ordinary url query params.
        # :solr_local_parameters will be sent using Solr LocalParams
        # syntax, as eg {! qf=$title_qf }. This is neccesary to use
        # Solr parameter de-referencing like $title_qf.
        # See: http://wiki.apache.org/solr/LocalParams
        solr_name = solr_name(prop.to_s, :stored_searchable)
        field.solr_local_parameters = {
          qf: solr_name,
          pf: solr_name
        }
      end
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    # label is key, solr field is value
    config.add_sort_field "score desc, #{uploaded_field} desc", label: "relevance"
    config.add_sort_field "#{uploaded_field} desc", label: "date uploaded \u25BC"
    config.add_sort_field "#{uploaded_field} asc", label: "date uploaded \u25B2"
    config.add_sort_field "#{modified_field} desc", label: "date modified \u25BC"
    config.add_sort_field "#{modified_field} asc", label: "date modified \u25B2"

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5
  end

  # disable the bookmark control from displaying in gallery view
  # Hyrax doesn't show any of the default controls on the list view, so
  # this method is not called in that context.
  def render_bookmarks_control?
    false
  end
end
