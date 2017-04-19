# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    # borthwick registers ontology
    class BorthwickRegisters < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/borthwick-registers#')
      # Class definitions
      term :SingleDate,
           label: 'Single Date',
           comment: 'A single date, not a range.',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :EntryDate,
           label: 'Entry Date',
           comment: '',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :Entry,
           label: 'Entry',
           comment:
               %(A discreet textual entry on a document. This class has been
                devised specifically to describe the entries within an
                Archbishops' Register, but the same concept could apply to
                entries within a diary or calendar.),
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :Folio,
           label: 'Folio',
           comment: 'A single folio face, or page.',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :Register,
           label: 'Register',
           comment:
               'A Register, broadly conceived as a document containing
                entries.',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :RelatedAgent,
           label: 'Related Agent',
           subClassOf: 'http://xmlns.com/foaf/0.1/Agent',
           comment:
               'A person or group in the context of its relationship to another
                Object Class. This class is not intended to describe Persons
                or Groups independently.',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      term :RelatedPlace,
           label: 'Related Place',
           comment:
               'A place in the context of its relationship to another Object
                Class. This class is not intended to describe Places
                independently.',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      # Property definitions
      property :asWritten,
               label: 'As Written',
               comment:
                   'This property is used to capture the name of an entity as
                    it was expressed in the original resource.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               # doesn't like multiple ranges
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               domain: 'rdf:Literal'

      property :descriptorAsWritten,
               label: 'As Written',
               comment:
                   'This property is a sub property of As Written and is used
                   to capture a descriptor for an Agent as expressed in the
                    original resource.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               subPropertyOf: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#descriptorAsWritten',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup',
               domain: 'rdf:Literal'

      property :certainty,
               label: 'Certainty',
               comment:
                   'This property is used for the certainty of a date.
                    It is recommended that this property is used with a
                    controlled list of values.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Date'

      property :dateType,
               label: 'Date Type',
               comment:
                   'This property is used for the type of date, eg. birth date
                    or document date.  It is recommended that this property is
                    used with a controlled list of values.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#SingleDate'

      property :reference,
               label: 'Reference',
               comment:
                   'This property is used for an archival reference.',
               subPropertyOf: 'dcterms:identifier',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      property :entryNo,
               label: 'Entry Number',
               comment:
                   'This property is used for the entry number of a
                    given Entry.',
               subPropertyOf: 'dcterms:identifier',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'

      property :folioNo,
               label: 'Folio Number',
               comment:
                   'This property is used for the folio or page number.
                    It should be used in conjunction with Folio Type where
                    anything other than Folios numbers are being captured,
                    eg. for a membrane or page.',
               subPropertyOf: 'dcterms:identifier',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :folioFace,
               label: 'Folio Face',
               comment:
                   'This property is used for the folio face. Commonly recto
                    or verso. It is recommended that this property is used with
                    a controlled list of values.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :folio,
               label: 'Folio',
               comment:
                   %(This property is used to associate an entry with the
                    folio(s) on which it appears. It's value should be a URI
                    for the Folio.),
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :continuesOn,
               label: 'Continues On',
               comment:
                   'This property is used to indicate that the described Entry
                    continues on the given Folio. Another Entry would be created
                    to capture the continued information, related to the given
                    Folio with
                    http://dlib.york.ac.uk/ontologies/borthwick-registers#folio',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :marginalia,
               label: 'Marginalia',
               comment: 'This property is used for marginal notes.',
               subPropertyOf: 'dcterms:description',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'rdf:Literal'

      property :summary,
               label: 'Summary',
               comment:
                   'This property is used for a brief summary of the
                    entry.',
               subPropertyOf: 'dcterms:description',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'rdf:Literal'

      property :editorialNote,
               label: 'Editorial Note',
               comment:
                   'This property is used for editorial notes, for example
                    notes intended to inform those editing and indexing the
                    records, rather than information for the
                    general user.',
               subPropertyOf: 'dcterms:description',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'rdf:Literal'

      property :entryType,
               label: 'Entry Type',
               comment:
                   'This property is used for the type of Entry.  .
                    It is recommended that this property is used with a
                    controlled list of values.',
               subPropertyOf: 'dcterms:description',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'rdf:Literal'

      property :sectionType,
               label: 'Section Type',
               comment:
                   'This property is used for the section type for an Entry.
                    It is recommended that this property is used with a
                    controlled list of values.',
               subPropertyOf: 'dcterms:description',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               domain: 'rdf:Literal'

      property :placeType,
               label: 'Place Type',
               comment:
                   'This property is used for the type of Place.  .
                    It is recommended that this property is used with a
                    controlled list of values.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'

      property :role,
               label: 'Role',
               comment:
                   'This property is used for the role played by the
                    described Object Class.
                    It is recommended that this property is used with a
                    controlled list of values.',
               subPropertyOf: 'http://schema.org/Role',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#'
      # doesn't like multple ranges
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze

      property :descriptor,
               label: 'Descriptor',
               comment:
                   'This property is used for the descriptor of the described
                    Agent. A descriptor might be the occupation, status or
                    other significant qualification.
                    It is recommended that this property is used with a
                    controlled list of values.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'

      property :isBlank,
               label: 'Is Blank',
               comment:
                   'This property is used to capture if the described Folio
                    is blank.
                    A true or false value is recommended.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               domain: 'rdf:Literal',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :isMissing,
               label: 'Is Missing',
               comment:
                   'This property is used to capture if a Folio should exist,
                    but is missing from the sequence.
                    A true or false value is recommended.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               domain: 'rdf:Literal',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'

      property :relatedAgentFor,
               label: 'Related Agent For',
               comment:
                   'This property creates a link from the described Agent to
                     the Object Class it is related to, for example
                    a Person related to an Entry.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'

      property :relatedPlaceFor,
               label: 'Related Place For',
               comment:
                   'This property creates a link from the described Place
                    to the Object Class it is related to, for example
                    a Place related to a Person.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               # doesn't like multiples
               # domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               # domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'

      property :entryDateFor,
               label: 'Entry Date For',
               comment:
                   'This property creates a link from the described Date to the
                    Object Class it is related to, for example
                    a Date related to an Entry.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate',
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'

      property :dateFor,
               label: 'Date For',
               comment:
                   'This property creates a link from the described Single Date
                    to the Entry Date it is related to.',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/borthwick-registers#',
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#SingleDate',
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'

      # Extra definitions
      term :'',
           comment:
               'Borthwick Institute for Archives
                ontology for Registers.',
           'dc:modified' => '2016', # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/',
           'dc:title' => 'Borthwick Registers Ontology',
           label: 'Borthwick Registers',
           'owl:versionInfo' => '2016' # TODO: date
    end
  end
end
