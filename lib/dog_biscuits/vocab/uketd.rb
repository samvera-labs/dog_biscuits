require 'rdf'
module DogBiscuits
  module Vocab
    class Uketd < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/uketd#')
      # TODO: publish whole thing
      # Property definitions
      property :advisor,
               comment: 'TODO.'.freeze,
               label: 'Advisory'.freeze,
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/'.freeze,
               type: 'rdf:Property'.freeze
      property :department,
               comment: 'TODO.'.freeze,
               label: 'Department'.freeze,
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/'.freeze,
               type: 'rdf:Property'.freeze
      property :qualificationLevel,
               comment: 'TODO.'.freeze,
               label: 'Qualification Level'.freeze,
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/'.freeze,
               type: 'rdf:Property'.freeze
      property :qualificationName,
               comment: 'TODO.'.freeze,
               label: 'Qualification Name'.freeze,
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/'.freeze,
               type: 'rdf:Property'.freeze
      property :institution,
               comment: 'TODO.'.freeze,
               label: 'Institution'.freeze,
               'rdf:isDefinedBy' => 'http://naca.central.cranfield.ac.uk/ethos-oai/2.0/'.freeze,
               type: 'rdf:Property'.freeze

      # Extra definitions
      term :'',
           comment: 'TODO'.freeze,
           'dc:modified' => 'TODO'.freeze, # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/'.freeze,
           'dc:title' => 'TODO'.freeze,
           label: 'Generic'.freeze,
           'owl:versionInfo' => 'TODO'.freeze # TODO: version
    end
  end
end
