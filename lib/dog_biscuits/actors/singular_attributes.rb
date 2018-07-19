# frozen_string_literal: true

module DogBiscuits
  module Actors
    module SingularAttributes
      # TODO: Test This

      # Override the BaseActor #clean_attributes method to apply this to all configured singular properties
      # Cast any singular values from the form to multiple values for persistence
      def clean_attributes(attributes)
        DogBiscuits.config.singular_properties.each do |prop|
          next if attributes[prop].blank?
          attributes[prop] = Array(attributes[prop]) if attributes.key? prop
        end
        super
      end
    end
  end
end
