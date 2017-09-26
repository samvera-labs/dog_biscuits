# frozen_string_literal: true

module DogBiscuits
  module IndexesJournalArticle
    include DogBiscuits::IndexesCommon

    # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
    #   are indexed in solr
    def values_to_index
      ['creator', 'project', 'managing_organisation', 'department']
    end

    # Add any properties to ensure they are 'mixed in' with the *_labels field in solr
    def strings_to_index
      ['creator']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    def do_local_indexing(solr_doc); end
  end
end
