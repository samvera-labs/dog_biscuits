# frozen_string_literal: true

module DogBiscuits
  # thesis
  class Thesis < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddThesisMetadata

    before_save :combine_dates

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
      true
    end

    # Index additional fields into solr
    class ThesisIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesThesis
    end

    def self.indexer
      ThesisIndexer
    end

    def combine_dates
      self.date = []
      date << date_of_award
    end
  end
end
