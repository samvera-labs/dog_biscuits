# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(Rails.root.join('config', 'dog_biscuits.yml'))).with_indifferent_access
# include Terms

# Configuration
DogBiscuits.config do |config|

  # For each model, there are two configurations available, for example:
  #   config.conference_item_properties = []
  #   config.conference_item_properties_required = []
  # Both are set to defaults:
  #    _required fields defaults to the Hyrax default (title, creator, keyword, rights_statment)
  #    _properties defaults to all properties, in the following order:
  #    1) basic_metadata (same order as in Hyrax),
  #    2) alphebetized model specific properties
  #    3) alphebetized remaining common fields

  # All properties must appear in property_mappings
  # To add a new local property (new_property below), do:
  #   DogBiscuits.config.property_mappings[:new_property] = {}
  # To change an existing property (existing_property), do:
  #   DogBiscuits.config.property_mappings[:existing_property] = {}
  #
  # The hash must contain an index for use in the catalog_controller.rb, eg.
  #   DogBiscuits.config.property_mappings[:new_property] =
  #     {
  #       index: "('new_property', :stored_sortable)"
  #     }
  #    It may also contain schema_org information, a label and help_text:
  #     index: "('new_property', :stored_sortable)",
  #     schema_org: {
  #          property: "identifier"
  #        },
  #     label: "New property",
  #     help_text "Some help text."
  #     }


end
