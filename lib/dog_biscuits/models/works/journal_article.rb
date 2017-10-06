# frozen_string_literal: true

module DogBiscuits
  class JournalArticle < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/JournalArticle')

    # Indexer
    # self.indexer = DogBiscuits::JournalArticleIndexer
    # Metadata
    # include DogBiscuits::JournalArticleMetadata

    before_save :combine_dates

    def journal_article?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      self.date = []
      date << date_published
      date << date_available
      date << date_accepted
      date << date_submitted
      date << date_created
    end
  end
end
