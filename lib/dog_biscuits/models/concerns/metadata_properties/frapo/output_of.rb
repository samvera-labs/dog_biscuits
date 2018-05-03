# frozen_string_literal: true

module DogBiscuits
  module OutputOf
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :output_of_resource,
                              class_name: 'DogBiscuits::Project',
                              predicate:
                                  DogBiscuits::Vocab::UlccTerms.outputOf

      property :output_of, predicate: ::RDF::URI.new('http://purl.org/cerif/frapo/isOutputOf') do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
