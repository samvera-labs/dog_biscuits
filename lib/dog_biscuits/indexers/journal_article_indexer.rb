# frozen_string_literal: true

module DogBiscuits
  class JournalArticleIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    def contributors_to_index
      ['editor', 'funder']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    def do_local_indexing(solr_doc); end
  end
end
