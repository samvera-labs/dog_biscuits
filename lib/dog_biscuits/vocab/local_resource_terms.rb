# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    # dlib generic ontology
    class LocalResourceTerms < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/local_resource_terms#')
      # Class definitions

      # Property definitions
      property :qualificationName,
               comment:
                   'This property is used for a resource URI for UKETD#qualificationName.',
               label: 'Qualification Name',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#',
               type: 'rdf:Property'
      property :localDepartment,
               comment:
                   'This property is used for a resource URI for UKETD#department.',
               label: 'Department',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#',
               type: 'rdf:Property'
      property :awardingInstitution,
               comment:
                   'This property is used for a resource URI for UKETD#awardingInstitution.',
               label: 'Awarding Institution',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#',
               subPropertyOf: 'http://dublincore.org/documents/dcmi-terms/identifier',
               type: 'rdf:Property'
      property :advisor,
               comment:
                   'This property is used for a resource URI for UKETD#advisor.',
               label: 'Advisor',
               range: 'http://xmlns.com/foaf/0.1/Person',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment:
               'Local resource terms ontology.',
           'dc:modified' => '2016', # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/',
           'dc:title' => 'York Digital Library Generic Ontology',
           label: 'Generic',
           'owl:versionInfo' => '2016' # TODO: date
    end
  end
end
