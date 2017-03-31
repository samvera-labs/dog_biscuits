module DogBiscuits
  module IndexesDataset
    extend ActiveSupport::Concern
    include DogBiscuits::IndexesCommon

    included do

      # Add all properties called *_resource to ensure the preflabel and altlabel of the related object
      #   are indexed in solr
      # Method must exist, but can return an empty array
      def get_values_to_index
        %w(creator publisher managing_organisation)
      end

      # Add any properties to ensure they are 'mixed in' with the *_values field in solr
      # Method must exist, but can return an empty array
      def get_strings_to_index
        []
      end

      # Add any custom indexing into here. Method must exist, but can be empty.
      def do_local_indexing(solr_doc)
        # add a stored text index for the 'access_rights' property in solr
        # so that case-insensitive sorting can be done on it
        solr_doc['dc_access_rights_tesi'] = object.dc_access_rights.collect { |x| x }
      end

    end

  end
end