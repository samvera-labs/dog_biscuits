require 'rdf'
module DogBiscuits
  module Vocab
    # dlib generic ontology
    class UlccTerms < RDF::Vocabulary('http://london.ac.uk/ontologies/terms#')
      # Class definitions

      # Property definitions
      property :refereed,
               comment:
                   'This property is used to indicate that a a resource has undergone peer review.'.freeze,
               label: 'Refereed'.freeze,
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#'.freeze,
               type: 'rdf:Property'.freeze
      property :officialUrl,
               comment:
                   'This property is used for an official or canonical url,
                such as the publisher url for a journal article.'.freeze,
               label: 'Official URL'.freeze,
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#'.freeze,
               type: 'rdf:Property'.freeze
      property :outputOf,
               comment:
                   'This property is used for to link an output with the endeavour out of which it was
                    created, for example a funded project.'.freeze,
               label: 'Output Of'.freeze,
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#'.freeze,
               type: 'rdf:Property'.freeze
      property :dateSubmitted,
               comment:
                   'The date of submission, eg. to a journal.'.freeze,
               label: 'Date Submitted'.freeze,
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#'.freeze,
               type: 'rdf:Property'.freeze

      # Extra definitions
      term :'',
           comment:
               'General purpose ontology for ULCC repository.'.freeze,
           'dc:modified' => '2017'.freeze,
           'dc:publisher' => 'http://www.london.ac.uk/'.freeze,
           'dc:title' => 'UlCC Terms Ontology'.freeze,
           label: 'Generic'.freeze,
           'owl:versionInfo' => '2017'.freeze
    end
  end
end
