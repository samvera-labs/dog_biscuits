# frozen_string_literal: true

module DogBiscuits
  class JournalArticle < Work
    include DogBiscuits::AddWorkBehaviour
    include DogBiscuits::AddJournalArticleMetadata

    before_save :combine_dates

    type << ::RDF::URI.new('http://purl.org/spar/fabio/JournalArticle')

    def journal_article?
      true
    end

    class JournalArticleIndexer < Hyrax::WorkIndexer
      include DogBiscuits::IndexesJournalArticle
    end

    def self.indexer
      JournalArticleIndexer
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
