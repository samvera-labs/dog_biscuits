# frozen_string_literal: true

module DogBiscuits
  module Actors
    module CleanSingularAttributes
      # TODO: Test This

      private

        # NOT SURE THIS IS EVEN NEEDED
        # FIGURE OUT AND ADD TO DB IF NEEDED
        # Override the BaseActor method to apply this to all configured singular properties
        # Cast any singular values from the form to multiple values for persistence
        # also remove any blank assertions
        # TODO this method could move to the work form.
        def clean_singular_attributes(attributes)
          DogBiscuits.config.singular_properties.each do |prop|
            attributes[prop] = Array(attributes[prop]) if attributes.key? prop
          end
          remove_blank_attributes!(attributes)
        end
    end
  end
end
