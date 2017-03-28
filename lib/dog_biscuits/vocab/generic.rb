require 'rdf'
module DogBiscuits
  module Vocab
    # dlib generic ontology
    class Generic < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/generic#')
      # Class definitions
      term :OrderedCollection,
           comment:
               'A collection with members that has a logical order.'.freeze,
           label: 'Ordered Collection'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :GenericWork,
           comment:
               'A work that does not fit into any pre-existing model,
                eg. an unidentified data file.'.freeze,
           label: 'Generic Work'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :Package,
           comment: 'A package.'.freeze,
           label: 'Package'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :MainFile,
           comment:
               'A main file. For example, the examined thesis PDF as
                distinguished from additional material such as
                appendices.'.freeze,
           label: 'Main File'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze
      term :Readme,
           comment:
               'A readme file. Normally a plain text file used to provide
                information about how to use the containing resource.
                Most common use would be for datasets or software.'.freeze,
           label: 'Readme'.freeze,
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'.freeze

      # Property definitions
      property :approved,
               comment:
                   'This property is used to indicate that a term or value
                    has been approved.'.freeze,
               label: 'Approved'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :rules,
               comment:
                   'This property is used to the rule, eg. cataloguing or
                    descriptive rules, used to construct the given
                    description.'.freeze,
               label: 'Rules'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :formerIdentifier,
               comment:
                   'This property is used for a former identifier for the given
                    object.'.freeze,
               label: 'Former Identifier'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://dublincore.org/documents/dcmi-terms/identifier'.freeze,
               type: 'rdf:Property'.freeze
      property :preTitle,
               comment:
                   'This property should be used as designated in the NCA
                    Rules http://archiveshub.ac.uk/ncarules/.'.freeze,
               label: 'Pre Title'.freeze,
               range: 'http://xmlns.com/foaf/0.1/Person'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :datesOfOffice,
               comment:
                   'This property should be used for the dates of office for
                    the described Person.'.freeze,
               label: 'Dates of Office'.freeze,
               range: 'http://xmlns.com/foaf/0.1/Person'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://data.archiveshub.ac.uk/def/dates'.freeze,
               type: 'rdf:Property'.freeze
      property :groupType,
               comment:
                   'This property is used for the type of Group.
                    It is recommended that this property is used with a
                    controlled list of values.'.freeze,
               label: 'Group Type'.freeze,
               range: 'http://xmlns.com/foaf/0.1/Group'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :qualifier,
               comment:
                   'This property should be used to qualify the name of a
                    Group, Organisation or Corporate Body,
                    for examples with dates of existence or place.'.freeze,
               label: 'Qualifier'.freeze,
               range: 'http://xmlns.com/foaf/0.1/Group'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :isTopConcept,
               comment:
                   'This property is used to indicate that the described
                    Concept is at the top of the hierarchy. A value of
                    true or false is recommended.'.freeze,
               label: 'Is Top Concept'.freeze,
               range: 'http://www.w3.org/2004/02/skos/core#Concept'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :readme,
               comment:
                   %(This property should be used to provide a textual
                      desicption of the given work to facilitate it's
                      understanding and use. A README file is common
                      parlance in coding.).freeze,
               label: 'README'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :forIndexing,
               comment:
                   'This property should be used to store data that does
                    not need to be displayed but may be useful for
                    searching.'.freeze,
               label: 'For Index'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :embargoRelease,
               comment:
                   'This property should be used to specify the end date of
                    an embargo period.'.freeze,
               label: 'Embargo Release Date'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :lastAccess,
               comment:
                   'This property should be used to for the date a resource,
                    or group of resources, was last accessed.'.freeze,
               label: 'Date of Last Access'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :status,
               comment:
                   'This property should be used to for the status of the
                    given object, eg. workflow status.'.freeze,
               label: 'Status'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :requestorEmail,
               comment: 'This property should be used to record the email
                          address of a requestor.'.freeze,
               label: 'Requestor Email'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :retentionPolicy,
               comment:
                   'This property should be used for the retention policy of
                    the given resource. A value frim a conrolled vocabulary is
                    recommended.'.freeze,
               label: 'Retention Policy'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :restrictionNote,
               comment:
                   'This property should be used for free-texts about data
                    restrictions and access.'.freeze,
               label: 'Restriction Note'.freeze,
               # TODO: subproperty of dc.description
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :hasMainFile,
               comment:
                   %(This property should be used to create a relationship between an object
                    and it's 'main file'. For example, a Thesis/Dissertation and it's PDF file.).freeze,
               label: 'Has Main File'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :hasReadmeFile,
               comment:
                   %(This property should be used to create a relationship between an object
                    and it's 'readme file'.).freeze,
               label: 'Has Readme File'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :moduleCode,
               comment:
                   'This property should be used for a course modul code, eg. from SITS.'.freeze,
               label: 'Module Code'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               type: 'rdf:Property'.freeze
      property :packages,
               comment:
                   'This property should be used for a the relationship between a Package and the
                    Works represented by that package.'.freeze,
               label: 'Packaged'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://pcdm.org/models#hasRelatedObject'.freeze,
               type: 'rdf:Property'.freeze
      property :packagedBy,
               comment:
                   'This property should is the inverse of packages.'.freeze,
               label: 'Packaged By'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf'.freeze,
               type: 'rdf:Property'.freeze
      property :numberOfDownloads,
               comment:
                   "A count of number of downloads of the given object, or it's member files.".freeze,
               label: 'Number Of Downloads'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf'.freeze,
               type: 'rdf:Property'.freeze
      property :collectionsCategory,
               comment:
                   'A controlled value for the collections categorisation code.'.freeze,
               label: 'Collections Category'.freeze,
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/generic#'.freeze,
               subPropertyOf: 'http://pcdm.org/models#relatedObjectOf'.freeze,
               type: 'rdf:Property'.freeze

      # Extra definitions
      term :'',
           comment:
               'General purpose ontology for York Digital Library.'.freeze,
           'dc:modified' => '2016'.freeze, # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/'.freeze,
           'dc:title' => 'York Digital Library Generic Ontology'.freeze,
           label: 'Generic'.freeze,
           'owl:versionInfo' => '2016'.freeze # TODO: date
    end
  end
end
