module DogBiscuits
  module IndexesThesis
    extend ActiveSupport::Concern
    include DogBiscuits::IndexesCommon

    included do
      # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
      #   are indexed in solr
      # Method must exist, but can return an empty array
      def get_values_to_index
        %w(creator department awarding_institution advisor)
      end

      # Add any properties to ensure they are 'mixed in' with the *_values field in solr
      # Method must exist, but can return an empty array
      def get_strings_to_index
        []
      end

      # Add any custom indexing into here. Method must exist, but can be empty.
      def do_local_indexing(solr_doc)
        solr_doc['contributor_tesim'] = object.advisor_resource.collect { |x| x.preflabel }
        solr_doc['contributor_sim'] = object.advisor_resource.collect { |x| x.preflabel }
      end
    end
  end
end