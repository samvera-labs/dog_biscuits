# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(Rails.root.join('config', 'dog_biscuits.yml'))).with_indifferent_access
# include Terms

# Configuration
DogBiscuits.config do |config|

  # Models used in the application.
  #   available models are:
  config.selected_models = config.available_models

  # All solr fields that will be used as facets in the search page.
  #   The ordering of the field names is the order of the display
  #   The properties must have been indexed as facetable
  #   Add values as symbols (eg. :creator)
  # config.facet_properties += [] # add to the end of the current list
  # config.facet_properties = [] # replace the current list

  # *All* solr fields to be displayed in the index (search results) view
  #   The ordering of the field names is the order of the display
  #   Add values as symbols (eg. :creator)
  # config.index_properties += [] # add to the end of the current list
  # config.index_properties = [] # replace the current list

  # WORK PROPERTIES
  # For each model, there are two configurations available.
  # Both are set to defaults:
  #    _required fields defaults to the Hyrax default (title, creator, keyword, rights_statment)
  #    _properties defaults to all properties available to that model, alphabetized
  #  Example:
  #    config.conference_item_properties = []
  #    config.conference_item_properties_required = []

  # PROPERTY MAPPINGS
  # All properties must be included in property_mappings. This is used by generators for building
  #   schema_org, locales, catalog_controller and attribute_rows. Adding info here and using
  #   generators saves on a lot of manual editing.
  #
  # To add a new local property (new_property below), do:
  #   config.property_mappings[:new_property] = {}
  #
  # To change an existing property (existing_property), do:
  #   config.property_mappings[:existing_property] = {}
  #
  # The hash may contain index for use in the catalog_controller.rb, eg.
  #   config.property_mappings[:new_property] =
  #     {
  #       index: "('new_property', :stored_sortable)"
  #     }
  #
  #  The hash may contain schema_org mappings for addition to config/schema_org.yml:
  #    {
  #      index: "('new_property', :stored_sortable)",
  #      schema_org: {
  #      property: 'identifier'
  #      }
  #    }
  #
  # The hash may contain label and help_text for use in the locales, and views:
  #    {
  #      index: "('new_property', :stored_sortable)",
  #      schema_org: {
  #      property: 'identifier'
  #      },
  #      label: 'New property',
  #      help_text 'Some help text.',
  #    }
  #
  # The hash may contain references to custom renderers and helper methods:
  #    {
  #      index: "('new_property', :stored_sortable)",
  #      schema_org: {
  #      property: 'identifier'
  #      },
  #      label: 'New property',
  #      help_text 'Some help text.',
  #      render_as: 'new_property' # assuming app/renderers/new_property_attribute_renderer.rb exists
  #      helper_method: 'new_property_helper' # assuming new_property_helper method exists in app/helpers/hyrax_helper.rb
  #    }

end
