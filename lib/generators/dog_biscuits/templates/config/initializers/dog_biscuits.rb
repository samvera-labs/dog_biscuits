# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(File.expand_path('../../dog_biscuits.yml', __FILE__))).with_indifferent_access
# include Terms

# Configuration
DogBiscuits.config do |config|

  # Configure the class for creator
  # config.creator_class = String
end
