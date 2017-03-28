require 'rdf'
module DogBiscuits
  module Vocab
    # borthwick registers ontology
    class BorthwickRegisters < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/borthwick-registers#')
      include DogBiscuits::BorthwickClasses, DogBiscuits::BorthwickProperties

      # Extra definitions
      term :'',
           comment:
               'Borthwick Institute for Archives
                ontology for Registers.'.freeze,
           'dc:modified' => '2016'.freeze, # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/'.freeze,
           'dc:title' => 'Borthwick Registers Ontology'.freeze,
           label: 'Borthwick Registers'.freeze,
           'owl:versionInfo' => '2016'.freeze # TODO: date
    end
  end
end
