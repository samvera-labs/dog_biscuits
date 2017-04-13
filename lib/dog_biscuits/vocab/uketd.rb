# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    class Uketd < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/uketd#')
      # TODO: publish whole thing
      # Property definitions
      property :advisor,
               comment: 'TODO.',
               label: 'Advisory',
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/',
               type: 'rdf:Property'
      property :department,
               comment: 'TODO.',
               label: 'Department',
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/',
               type: 'rdf:Property'
      property :qualificationLevel,
               comment: 'TODO.',
               label: 'Qualification Level',
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/',
               type: 'rdf:Property'
      property :qualificationName,
               comment: 'TODO.',
               label: 'Qualification Name',
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/',
               type: 'rdf:Property'
      property :institution,
               comment: 'TODO.',
               label: 'Institution',
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment: 'TODO',
           'dc:modified' => 'TODO', # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/',
           'dc:title' => 'TODO',
           label: 'Generic',
           'owl:versionInfo' => 'TODO' # TODO: version
    end
  end
end
