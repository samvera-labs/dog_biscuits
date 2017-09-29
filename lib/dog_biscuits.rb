# frozen_string_literal: true

module DogBiscuits
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Configuration
  end

  module Vocab
    extend ActiveSupport::Autoload
    eager_autoload do
      autoload :Generic
      autoload :BorthwickRegisters
      autoload :OaisArchivematica
      autoload :PureTerms
      autoload :Uketd
      autoload :LocalResourceTerms
      autoload :UlccTerms
    end
  end

  autoload_under 'services' do
    autoload :Terms
    autoload :TermsService
  end

  autoload_under 'models' do
    autoload :Work
    autoload :Authority
  end

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
    autoload :Place
    autoload :Agent
    autoload :Project
  end
  autoload_under 'models/authorities/agents' do
    autoload :Group
    autoload :HistoricPerson
    autoload :Organisation
    autoload :Person
  end

  autoload_under 'models/collections' do
    autoload :Collection
  end
  autoload_under 'models/filesets' do
    autoload :FileSet
  end
  autoload_under 'models/works' do
    autoload :ConferenceItem
    autoload :Dataset
    autoload :ExamPaper
    autoload :JournalArticle
    autoload :Package
    autoload :PublishedWork
    autoload :Thesis
  end

  autoload_under 'models/concerns' do
    autoload :ExtendedSolrDocument
  end

  autoload_under 'models/concerns/model_property_sets' do
    autoload :AddAgentMetadata
    autoload :AddConferenceItemMetadata
    autoload :AddDatasetMetadata
    autoload :AddExamPaperMetadata
    autoload :AddJournalArticleMetadata
    autoload :AddPackageMetadata
    autoload :AddPublishedWorkMetadata
    autoload :AddThesisMetadata
  end

  autoload_under 'models/concerns/model_property_sets/common' do
    autoload :CommonLabels
    autoload :CommonMetadata
    autoload :CommonRights
  end

  autoload_under 'models/concerns/metadata_properties/archivematica' do
    autoload :Archivematica
  end

  autoload_under 'models/concerns/metadata_properties/archives_hub' do
    autoload :HubDates
  end

  autoload_under 'models/concerns/metadata_properties/bibframe' do
    autoload :AwardingInstitution
    autoload :Edition
    autoload :IdentifiedBy
    autoload :InJournal
    autoload :InProceeding
    autoload :OriginDate
    autoload :Part
    autoload :PartOf
    autoload :PlaceOfPublication
    autoload :Series
  end

  autoload_under 'models/concerns/metadata_properties/bibo' do
    autoload :PresentedAt
    autoload :PublicationStatus
  end

  autoload_under 'models/concerns/metadata_properties/dc' do
    autoload :Abstract
    autoload :AccessRights
    autoload :Available
    autoload :BibliographicCitation
    autoload :Creator
    autoload :Contributor
    autoload :Date
    autoload :DateAccepted
    autoload :DateCreated
    autoload :Description
    autoload :Identifier
    autoload :Language
    autoload :Publisher
    autoload :ResourceType
    autoload :Rights
    autoload :RightsHolder
    autoload :Source
    autoload :Subject
    # autoload :Title # part of CoreMetadata
    autoload :SimpleVersions
  end

  autoload_under 'models/concerns/metadata_properties/dlib' do
    autoload :ForIndexing
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :GenericModuleCode
    autoload :GenericQualifier
    autoload :LastAccess
    autoload :MainFile
    autoload :NumberOfDownloads
    autoload :ReadmeFile
  end

  autoload_under 'models/concerns/metadata_properties/edm' do
    autoload :EdmRights
  end

  autoload_under 'models/concerns/metadata_properties/fabio' do
    autoload :EmbargoRelease
  end

  autoload_under 'models/concerns/metadata_properties/foaf' do
    autoload :BasedNear
    autoload :FoafName
  end

  autoload_under 'models/concerns/metadata_properties/lc_identifiers' do
    autoload :Doi
    autoload :Isbn
    autoload :Orcid
  end

  autoload_under 'models/concerns/metadata_properties/mads' do
    autoload :RelatedAuthority
  end

  autoload_under 'models/concerns/metadata_properties/marc_relators' do
    autoload :Funder
    autoload :Editor
  end

  autoload_under 'models/concerns/metadata_properties/owl' do
    autoload :OwlSameAs
  end

  autoload_under 'models/concerns/metadata_properties/premis' do
    autoload :HasRestriction
  end

  autoload_under 'models/concerns/metadata_properties/property_sets' do
    autoload :PersonProperties
    autoload :PlaceProperties
  end

  autoload_under 'models/concerns/metadata_properties/pure' do
    autoload :Pure
    autoload :ManagingOrganisation
  end

  autoload_under 'models/concerns/metadata_properties/rdf' do
    autoload :RdfType
    autoload :RelatedUrl
    autoload :RdfsLabel
  end

  autoload_under 'models/concerns/metadata_properties/schema' do
    autoload :ContentVersion
    autoload :DatePublished
    autoload :IssueNumber
    autoload :Keyword
    autoload :Pagination
    autoload :VolumeNumber
    autoload :AlternateName
  end

  autoload_under 'models/concerns/metadata_properties/skos' do
    autoload :SkosLabels
    autoload :SkosNote
    autoload :SkosRelated
  end

  autoload_under 'models/concerns/metadata_properties/vivo' do
  end

  autoload_under 'models/concerns/metadata_properties/uketd' do
    autoload :Advisor
    autoload :DateOfAward
    autoload :Department
    autoload :Qualification
  end

  autoload_under 'models/concerns/metadata_properties/ulcc' do
    autoload :DateSubmitted
    autoload :ProjectOutput
    autoload :OfficialUrl
    autoload :Refereed
  end

  autoload_under 'models/concerns/behaviours' do
    # Behaviour
    autoload :AddWorkBehaviour
    autoload :PureSpecific
    # Validations
    autoload :ValidateConceptScheme
    autoload :ValidateConceptRelated
    autoload :ValidateLabel
    autoload :ValidatePlace
  end

  autoload_under 'indexers' do
    # Indexer classes
    autoload :ConferenceItemIndexer
    autoload :DatasetIndexer
    autoload :ExamPaperIndexer
    autoload :JournalArticleIndexer
    autoload :PublishedWorkIndexer
    autoload :ThesisIndexer
  end
  autoload_under 'indexers/concerns' do
    # Indexer modules
    autoload :IndexesCommon
  end

  autoload_under 'validators' do
    autoload :LabelValidator
    autoload :PlaceValidator
    autoload :ConceptSchemeMemberValidator
    autoload :ConceptRelatedValidator
  end

  # @api public
  #
  # Exposes the DogBiscuits configuration
  #
  # @yield [DogBiscuits::Configuration] if a block is passed
  # @return [DogBiscuits::Configuration]
  # @see DogBiscuits::Configuration for configuration options
  def self.config(&block)
    @config ||= DogBiscuits::Configuration.new

    yield @config if block

    @config
  end
end
