# frozen_string_literal: true

require 'rdf'
module DogBiscuits
  module Vocab
    class OaisArchivematica < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/oais-archivematica#')
      # Class definitions
      term :DisseminationInformationPackage,
           comment: 'A dissemination information package, as defined by the Reference Model for an Open Archival Information System (OAIS).',
           label: 'Dissemination Information Package (DIP)',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'

      term :ArchivalInformationPackage,
           comment: 'An archival information package, as defined by the Reference Model for an Open Archival Information System (OAIS).',
           label: 'Archival Information Package (AIP)',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'

      term :SubmissionInformationPackage,
           comment: 'A submission information package, as defined by the Reference Model for an Open Archival Information System (OAIS).',
           label: 'Submission Information Package (SIP)',
           'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
           # TODO: subClassOf: ''.freeze,
           type: 'rdf:Class'

      # Property definitions

      property :aipUuid,
               comment: 'This property should be used to for the unique identifier for an Archival Information Package (AIP).',
               label: 'AIP UUID',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :dipUuid,
               comment: 'This property should be used to for the unique identifier for a Dissemination Information Package (AIP).',
               label: 'DIP UUID',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :sipUuid,
               comment: 'This property should be used to for the unique identifier for a Submission Information Package (SIP).',
               label: 'SIP UUID',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :transferUuid,
               comment: 'This property should be used to for the unique identifier for a transfer.',
               label: 'Transfer UUID',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :aipCurrentPath,
               comment: 'This property should be used to for current path of the DIP.',
               label: 'Archivematica AIP Current Full Path',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :dipCurrentPath,
               comment: 'This property should be used to for current path of the DIP.',
               label: 'Archivematica DIP Current Full Path',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :dipCurrentLocation,
               comment: 'This property should be used to for current location of the DIP.',
               label: 'Archivematica DIP Current Location',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :aipCurrentLocation,
               comment: 'This property should be used to for current location of the AIP.',
               label: 'Archivematica AIP Current Location',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :originPipeline,
               comment: 'This property should be used to for the origin pipeline of the AIP or DIP.',
               label: 'Archivematica Origin Pipeline',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :aipSize,
               comment: 'This property should be used to for the size of the AIP.',
               label: 'Archivematica AIP Size',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :dipSize,
               comment: 'This property should be used to for the size of the DIP.',
               label: 'Archivematica DIP Size',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :aipResourceUri,
               comment: 'This property should be used to for the resource uri of the AIP.',
               label: 'Archivematica AIP Resource URI',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :dipResourceUri,
               comment: 'This property should be used to for the resource uri of the DIP.',
               label: 'Archivematica DIP Resource URI',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematica#',
               type: 'rdf:Property'
      property :aipStatus,
               comment: 'This property should be used to for status of the AIP. The value should be taken from a controlled list.',
               label: 'AIP Status',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematic#',
               type: 'rdf:Property'
      property :dipStatus,
               comment: 'This property should be used to for status of the DIP. The value should be taken from a controlled list.',
               label: 'DIP Status',
               'rdf:isDefinedBy' => 'http://dlib.york.ac.uk/ontologies/oais-archivematic#',
               type: 'rdf:Property'

      # Extra definitions
      term :'',
           comment: 'General purpose ontology for York Digital Library.',
           'dc:modified' => '2016', # TODO: date
           'dc:publisher' => 'http://dlib.york.ac.uk/',
           'dc:title' => 'York Digital Library OAIS and Archivematica Ontology',
           label: 'Generic',
           'owl:versionInfo' => '2016' # TODO: date
    end
  end
end
