# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    class UlccTerms < RDF::Vocabulary('http://london.ac.uk/ontologies/terms#')
      # Class definitions
      property :ConferenceItem,
               comment:
                   'A document created for delivery or presentation at a conference, for example a paper, presentation, workshop or poster.',
               label: 'Conference Item',
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#',
               type: 'rdf:Class'
      property :PublishedWork,
               comment:
                   'A single published work, eg. a book, report, monograph etc.',
               label: 'Published Work',
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#',
               type: 'rdf:Class'
      # TODO: add subclass of and subclasses

      # Property definitions
      property :refereed,
               comment:
                   'This property is used to indicate that a a resource has undergone peer review.',
               label: 'Refereed',
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#',
               type: 'rdf:Property'
      property :outputOf,
               comment:
                   'This property is used for to link an output with the endeavour out of which it was
                    created, for example a funded project.',
               label: 'Output Of',
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#',
               type: 'rdf:Property'
      property :dateSubmitted,
               comment:
                   'The date of submission, eg. to a journal.',
               label: 'Date Submitted',
               'rdf:isDefinedBy' => 'http://london.ac.uk/ontologies/terms#',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment:
               'General purpose ontology for ULCC repository.',
           'dc:modified' => '2017',
           'dc:publisher' => 'http://www.london.ac.uk/',
           'dc:title' => 'UlCC Terms Ontology',
           label: 'Generic',
           'owl:versionInfo' => ''
    end
  end
end
