# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(File.expand_path('../../dog_biscuits.yml', __FILE__))).with_indifferent_access
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
end
