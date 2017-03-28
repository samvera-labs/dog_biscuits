module DogBiscuits
  # Journal Article
  class JournalArticle < Work
    include DogBiscuits::AddJournalArticleMetadata

    before_save :combine_dates

    type << ::RDF::URI.new('http://purl.org/spar/fabio/JournalArticle')

    def journal_article?
      true
    end

    # Index additional fields into solr
    class JournalArticleIndexer < Hyrax::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include DogBiscuits::IndexesJournalArticle
    end

    def self.indexer
      JournalArticleIndexer
    end

    def combine_dates
      self.date ||= []
      self.date << self.date_published
      self.date << self.date_available
      self.date << self.date_accepted
      self.date << self.date_submitted
    end

  end
end
