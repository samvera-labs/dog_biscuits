# frozen_string_literal: true

module DogBiscuits
  class JournalArticle < Work
    # Behavior
    include DogBiscuits::AddWorkBehaviour
    # Local metadata
    type << ::RDF::URI.new('http://purl.org/spar/fabio/JournalArticle')

    include DogBiscuits::AddJournalArticleMetadata

    before_save :combine_dates

    def journal_article?
      true
    end

    self.indexer = DogBiscuits::JournalArticleIndexer

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
