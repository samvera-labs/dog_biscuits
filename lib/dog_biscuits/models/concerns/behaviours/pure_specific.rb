# frozen_string_literal: true

module DogBiscuits
  # Behaviour only used where data is being pulled in from the PURE CRIS system.
  module PureSpecific
    extend ActiveSupport::Concern

    included do
      before_save :add_pure_type

      def add_pure_type
        rdf_type << DogBiscuits::Vocab::PureTerms.Organisation unless pure_uuid.nil? && organisation?
        rdf_type << DogBiscuits::Vocab::PureTerms.Person unless pure_uuid.nil? && person?
      end
    end
  end
end
