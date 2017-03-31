module DogBiscuits
  module IndexesJournalArticle
    extend ActiveSupport::Concern
    include DogBiscuits::IndexesCommon

    included do
      # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
      #   are indexed in solr
      def get_values_to_index
        %w(creator project managing_organisation department)
      end

      # Add any properties to ensure they are 'mixed in' with the *_values field in solr
      def get_strings_to_index
        ['creator']
      end

      # Add any custom indexing into here. Method must exist, but can be empty.
      def do_local_indexing(solr_doc); end
    end
  end
end