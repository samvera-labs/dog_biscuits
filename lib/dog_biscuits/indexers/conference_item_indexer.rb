# frozen_string_literal: true

module DogBiscuits
  class ConferenceItemIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # NB. include 'contributor' here if it is used in the form
    def contributors_to_index
      ['editor', 'funder']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc); end
  end
end
