require 'rdf'
module DogBiscuits
  module Vocab
    # dlib generic ontology
    class LocalResourceTerms < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/local_resource_terms#')
      # Class definitions

      # Property definitions
      property :qualificationName,
               comment:
                   'This property is used for a resource URI for UKETD#qualificationName.'.freeze,
               label: 'Qualification Name'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#'.freeze,
               type: 'rdf:Property'.freeze
      property :localDepartment,
               comment:
                   'This property is used for a resource URI for UKETD#department.'.freeze,
               label: 'Department'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#'.freeze,
               type: 'rdf:Property'.freeze
      property :awardingInstitution,
               comment:
                   'This property is used for a resource URI for UKETD#awardingInstitution.'.freeze,
               label: 'Awarding Institution'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#'.freeze,
               subPropertyOf: 'http://dublincore.org/documents/dcmi-terms/identifier'.freeze,
               type: 'rdf:Property'.freeze
      property :advisor,
               comment:
                   'This property is used for a resource URI for UKETD#advisor.'.freeze,
               label: 'Advisor'.freeze,
               range: 'http://xmlns.com/foaf/0.1/Person'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/local_resource_terms#'.freeze,
               type: 'rdf:Property'.freeze

      # Extra definitions
      term :'',
           comment:
               'Local resource terms ontology.'.freeze,
           'dc:modified' => '2016'.freeze, # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/'.freeze,
           'dc:title' => 'York Digital Library Generic Ontology'.freeze,
           label: 'Generic'.freeze,
           'owl:versionInfo' => '2016'.freeze # TODO: date
    end
  end
end
