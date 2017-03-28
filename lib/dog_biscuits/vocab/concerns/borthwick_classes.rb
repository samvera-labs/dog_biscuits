module DogBiscuits
  # borthwick registers classes
  module BorthwickClasses
    extend ActiveSupport::Concern
    included do
      # Class definitions
      term :SingleDate,
           label: 'Single Date'.freeze,
           comment: 'A single date, not a range.'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :EntryDate,
           label: 'Entry Date'.freeze,
           comment: ''.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :Entry,
           label: 'Entry'.freeze,
           comment:
               %(A discreet textual entry on a document. This class has been
                devised specifically to describe the entries within an
                Archbishops' Register, but the same concept could apply to
                entries within a diary or calendar.).freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :Folio,
           label: 'Folio'.freeze,
           comment: 'A single folio face, or page.'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :Register,
           label: 'Register'.freeze,
           comment:
               'A Register, broadly conceived as a document containing
                entries.'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :RelatedAgent,
           label: 'Related Agent'.freeze,
           subClassOf: 'http://xmlns.com/foaf/0.1/Agent'.freeze,
           comment:
               'A person or group in the context of its relationship to another
                Object Class. This class is not intended to describe Persons
                or Groups independently.'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze

      term :RelatedPlace,
           label: 'Related Place'.freeze,
           comment:
               'A place in the context of its relationship to another Object
                Class. This class is not intended to describe Places
                independently.'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'.freeze
    end
  end
end
