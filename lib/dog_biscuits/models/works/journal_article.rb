# frozen_string_literal: true

module DogBiscuits
  class JournalArticle < Work
    # Needed to set the type
    include ::Hydra::Works::WorkBehavior

    # Order matters because included metadata finalises things:
    #  1) type and local metadata
    #  2) indexer
    #  3) included metadata

    type << ::RDF::Vocab::SCHEMA.ScholarlyArticle

    # Indexer
    # self.indexer = DogBiscuits::JournalArticleIndexer
    # Metadata
    # include DogBiscuits::JournalArticleMetadata

    # before_save :combine_dates

    def journal_article?
      true
    end

    # Create single date field from all dates.
    def combine_dates
      tmpdate = date
      tmpdate << date_published
      tmpdate << date_available
      tmpdate << date_accepted
      tmpdate << date_submitted
      tmpdate << date_created
      date = tmpdate
    end
  end
end
