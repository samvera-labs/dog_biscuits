module DogBiscuits
  # all authority classes extend this
  class Authority < ActiveFedora::Base

    after_save :update_usages
    after_destroy :update_usages

    belongs_to :concept_scheme,
               class_name: 'DogBiscuits::ConceptScheme',
               predicate: ::RDF::Vocab::SKOS.inScheme

    def authority?
      true
    end
    def work?
      false
    end
    def file_set?
      false
    end
    def collection?
      false
    end
    def edit_groups
      ['admin']
    end

    # find any objects that use the authority term being updated or destroyed
    # update solr if it's a '_value'
    # re-save the object if it's a 'saved string'
    def update_usages
      SolrQuery.new.solr_query("values_tesim:#{self.id}",'id',1000)['response']['docs'].each do | r |
        ActiveFedora::Base.find(r['id']).update_index
      end

      SolrQuery.new.solr_query("authorities_tesim:#{self.id}",'id',1000)['response']['docs'].each do | r |
        ActiveFedora::Base.find(r['id']).save
      end
    end
  end
end
