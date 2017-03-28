module DogBiscuits
  # Journal metadata
  module InJournal
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :journal_resource,
                            class_name: 'DogBiscuits::Journal',
                            predicate: ::RDF::URI.new('https://vocab.org/frbr/core#partOf')

      property :journal,
               predicate: ::RDF::URI.new('https://vocab.org/frbr/core#partOf'),
               multiple: true do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
