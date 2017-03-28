require 'rdf'
module DogBiscuits
  module Vocab
    class PureTerms < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/pure#')
      # Class definitions
      term :Person,
           comment: 'Person from PURE'.freeze,
           label: 'Person'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :Organisation,
           comment: 'Organisation from PURE.'.freeze,
           label: 'Pure Organisation'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :PhdStudent,
           comment: 'Person from PURE, a PhD student.'.freeze,
           label: 'Pure Person Phd'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
           subClassOf: 'http://dlib.york.ac.uk/ontologies/pure#Person'.freeze,
           type: 'rdf:Class'.freeze

      # Property definitions
      property :pureUuid,
               comment: 'This property should be used to for the unique identifier for a PURE object.'.freeze,
               label: 'PURE UUID'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
               type: 'rdf:Property'.freeze
      property :pureCreated,
               comment: 'This property should be used to for the date of creation in PURE.'.freeze,
               label: 'PURE Creation Date'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
               type: 'rdf:Property'.freeze
      property :pureType,
               comment: 'This property should be used to for the type value in PURE,
                eg. type of person: internal or external.'.freeze,
               label: 'PURE Creation Date'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
               type: 'rdf:Property'.freeze
      property :pureManagingUnit,
               comment: 'This property should be used for the managing organisation in PURE.'.freeze,
               label: 'PURE Managing Organisational Unit'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
               type: 'rdf:Property'.freeze
      property :pureLink,
               comment: 'This property should be used for an external link in PURE.'.freeze,
               label: 'PURE Link'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#'.freeze,
               type: 'rdf:Property'.freeze

      # Extra definitions
      term :'',
           comment: 'Ontology of terms from PURE.'.freeze,
           'dc:modified' => '2016'.freeze, # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/'.freeze,
           'dc:title' => 'York Digital Library PURE Ontology'.freeze,
           label: 'Generic'.freeze,
           'owl:versionInfo' => '2016'.freeze # TODO: date
    end
  end
end
