# frozen_string_literal: true

module DogBiscuits
  class Book < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddBookMetadata

    before_save :combine_dates

    # TODO: set proper type
    type << ::RDF::Vocab::BIBO.Book

    def book?
      true
    end

    class BookIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesBook
    end

    def self.indexer
      BookIndexer
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_published
      date << date_available
      date << date_accepted
      date << date_submitted
    end
  end
end
