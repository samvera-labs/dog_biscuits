# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    class Generic < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/generic#')
      # Class definitions
      term :GenericWork,
           comment:
               'A work that does not fit into any pre-existing model,
                eg. an unidentified data file.',
           label: 'Generic Work',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
           type: 'rdf:Class'
      term :Package,
           comment: 'A package or batch of data. Intended for use to encapsualted a deposit or
                    batch upload or similar. The use of this term is administrative rather than user-facing.',
           label: 'Package',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
           type: 'rdf:Class'
      term :MainFile,
           comment:
               'A main file. For example, the examined thesis PDF as
                distinguished from additional material such as
                appendices.',
           label: 'Main File',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
           type: 'rdf:Class'
      term :Readme,
           comment:
               'A readme file. Normally a plain text file used to provide
                information about how to use the containing resource.
                Most common use would be for datasets or software.',
           label: 'Readme',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
           type: 'rdf:Class'

      # Property definitions
      property :approved,
               comment:
                   'This property is used to indicate that a term or value
                    has been approved.',
               label: 'Approved',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :rules,
               comment:
                   'This property is used to the rule, eg. cataloguing or
                    descriptive rules, used to construct the given
                    description.',
               label: 'Rules',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :formerIdentifier,
               comment:
                   'This property is used for a former identifier for the given
                    object.',
               label: 'Former Identifier',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://dublincore.org/documents/dcmi-terms/identifier',
               type: 'rdf:Property'
      property :preTitle,
               comment:
                   'This property should be used as designated in the NCA
                    Rules http://archiveshub.ac.uk/ncarules/.',
               label: 'Pre Title',
               range: 'http://xmlns.com/foaf/0.1/Person',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :datesOfOffice,
               comment:
                   'This property should be used for the dates of office for
                    the described Person.',
               label: 'Dates of Office',
               range: 'http://xmlns.com/foaf/0.1/Person',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://data.archiveshub.ac.uk/def/dates',
               type: 'rdf:Property'
      property :groupType,
               comment:
                   'This property is used for the type of Group.
                    It is recommended that this property is used with a
                    controlled list of values.',
               label: 'Group Type',
               range: 'http://xmlns.com/foaf/0.1/Group',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :qualifier,
               comment:
                   'This property should be used to qualify the name of a
                    Group, Organisation or Corporate Body,
                    for examples with dates of existence or place.',
               label: 'Qualifier',
               range: 'http://xmlns.com/foaf/0.1/Group',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :isTopConcept,
               comment:
                   'This property is used to indicate that the described
                    Concept is at the top of the hierarchy. A value of
                    true or false is recommended.',
               label: 'Is Top Concept',
               range: 'http://www.w3.org/2004/02/skos/core#Concept',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :readme,
               comment:
                   %(This property should be used to provide a textual
                      desicption of the given work to facilitate it's
                      understanding and use. A README file is common
                      parlance in coding.),
               label: 'README',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :forIndexing,
               comment:
                   'This property should be used to store data that does
                    not need to be displayed but may be useful for
                    searching.',
               label: 'For Index',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :lastAccess,
               comment:
                   'This property should be used to for the date a resource,
                    or group of resources, was last accessed.',
               label: 'Date of Last Access',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :status,
               comment:
                   'This property should be used to for the status of the
                    given object, eg. workflow status.',
               label: 'Status',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :requestorEmail,
               comment: 'This property should be used to record the email
                          address of a requestor.',
               label: 'Requestor Email',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :hasMainFile,
               comment:
                   %(This property should be used to create a relationship between an object
                    and it's 'main file'. For example, a Thesis/Dissertation and it's PDF file.),
               label: 'Has Main File',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :hasReadmeFile,
               comment:
                   %(This property should be used to create a relationship between an object
                    and it's 'readme file'.),
               label: 'Has Readme File',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :moduleCode,
               comment:
                   'This property should be used for a course modul code, eg. from SITS.',
               label: 'Module Code',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               type: 'rdf:Property'
      property :packages,
               comment:
                   'This property should be used for a the relationship between a Package and the
                    Works represented by that package.',
               label: 'Packaged',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://pcdm.org/models#hasRelatedObject',
               type: 'rdf:Property'
      property :packagedBy,
               comment:
                   'This property should is the inverse of packages.',
               label: 'Packaged By',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf',
               type: 'rdf:Property'
      property :numberOfDownloads,
               comment:
                   "A count of number of downloads of the given object, or it's member files.",
               label: 'Number Of Downloads',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf',
               type: 'rdf:Property'
      property :collectionsCategory,
               comment:
                   'A controlled value for the collections categorisation code.',
               label: 'Collections Category',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#',
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment:
               'General purpose ontology for York Digital Library. Terms not found in other schemes.',
           'dc:modified' => '2017',
           'dc:publisher' => '',
           'dc:title' => 'York Digital Library Generic Ontology',
           label: 'Generic',
           'owl:versionInfo' => ''
    end
  end
end
