# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(Rails.root.join('config', 'dog_biscuits.yml'))).with_indifferent_access
# include Terms

# Configuration
DogBiscuits.config do |config|

  # Models used in the application.
  #   available models are:
  config.selected_models = config.available_models

  # All solr fields that will be treated as facets by the blacklight application
  #   The ordering of the field names is the order of the display
  #   The properties must have been indexed as facetable
  #   Add values as symbols (eg. :creator)
  # config.facet_properties = []

  # *All* solr fields to be displayed in the index (search results) view
  #   The ordering of the field names is the order of the display
  #   Add values as symbols (eg. :creator)
  # config.index_properties = []

  # For each model, there are two configurations available, for example:
  #   config.conference_item_properties = []
  #   config.conference_item_properties_required = []
  # Both are set to defaults:
  #    _required fields defaults to the Hyrax default (title, creator, keyword, rights_statment)
  #    _properties defaults to all properties available to that model, alphabetized

  # All properties must be included in property_mappings. This is used by generators for building
  #   schema_org, locales, catalog_controller and attribute_rows. Adding info here and using
  #   generators saves on a lot of manual editing.
  #
  # To add a new local property (new_property below), do:
  #   DogBiscuits.config.property_mappings[:new_property] = {}
  #
  # To change an existing property (existing_property), do:
  #   DogBiscuits.config.property_mappings[:existing_property] = {}
  #
  # The hash must contain index for use in the catalog_controller.rb, eg.
  #   DogBiscuits.config.property_mappings[:new_property] =
  #     {
  #       index: "('new_property', :stored_sortable)"
  #     }
  #
  #  The hash may contain schema_org information, a label and help_text:
  #     index: "('new_property', :stored_sortable)",
  #     schema_org: {
  #          property: 'identifier'
  #        },
  #     label: 'New property',
  #     help_text 'Some help text.',
  #     }
  #  The hash may contain references to custom renderers and helper methods:
  #     index: "('new_property', :stored_sortable)",
  #     schema_org: {
  #          property: 'identifier'
  #        },
  #     label: 'New property',
  #     help_text 'Some help text.',
  #     render_as: 'new_property' # assuming app/renderers/new_property_attribute_renderer.rb exists
  #     helper_method: 'new_property_helper' # assuming new_property_helper method exists in app/helpers/hyrax_helper.rb
  #     }



end
