# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    class PureTerms < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/pure#')
      # Class definitions
      term :Person,
           comment: 'Person from PURE',
           label: 'Person',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'
      term :Organisation,
           comment: 'Organisation from PURE.',
           label: 'Pure Organisation',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'
      term :PhdStudent,
           comment: 'Person from PURE, a PhD student.',
           label: 'Pure Person Phd',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
           subClassOf: 'http://dlib.york.ac.uk/ontologies/pure#Person',
           type: 'rdf:Class'

      # Property definitions
      property :pureUuid,
               comment: 'This property should be used to for the unique identifier for a PURE object.',
               label: 'PURE UUID',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
               type: 'rdf:Property'
      property :pureCreated,
               comment: 'This property should be used to for the date of creation in PURE.',
               label: 'PURE Creation Date',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
               type: 'rdf:Property'
      property :pureType,
               comment: 'This property should be used to for the type value in PURE,
                eg. type of person: internal or external.',
               label: 'PURE Creation Date',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
               type: 'rdf:Property'
      property :pureManagingUnit,
               comment: 'This property should be used for the managing organisation in PURE.',
               label: 'PURE Managing Organisational Unit',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
               type: 'rdf:Property'
      property :pureLink,
               comment: 'This property should be used for an external link in PURE.',
               label: 'PURE Link',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/pure#',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment: 'Ontology of terms from PURE.',
           'dc:modified' => '2016', # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/',
           'dc:title' => 'York Digital Library PURE Ontology',
           label: 'Generic',
           'owl:versionInfo' => '2016' # TODO: date
    end
  end
end
