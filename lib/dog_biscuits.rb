# frozen_string_literal: true

module DogBiscuits
  extend ActiveSupport::Autoload

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
    autoload :SolrQuery
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
    autoload :Collection # TODO: refactor
  end
  autoload_under 'models/filesets' do
    autoload :FileSet
  end
  autoload_under 'models/works' do
    autoload :Package
    autoload :Dataset
    autoload :ExamPaper
    autoload :Thesis
    autoload :JournalArticle
  end

  autoload_under 'models/concerns/metadata/add_metadata' do
    autoload :AddAgentMetadata
    autoload :AddDatasetMetadata
    autoload :AddPackageMetadata
    autoload :AddExamPaperMetadata
    autoload :AddThesisMetadata
    autoload :AddJournalArticleMetadata
    autoload :AddPersonProperties
    autoload :AddPlaceProperties
  end

  autoload_under 'models/concerns/metadata/archivematica' do
    autoload :Archivematica
  end

  autoload_under 'models/concerns/metadata/archives_hub' do
    autoload :HubDates
  end

  autoload_under 'models/concerns/metadata/bibframe' do
    autoload :AwardingInstitution
    autoload :IdentifiedBy
  end

  autoload_under 'models/concerns/metadata/bibo' do
    autoload :PublicationStatus
  end

  autoload_under 'models/concerns/metadata/common' do
    autoload :CommonLabels
    autoload :CommonMetadata
    autoload :CommonRights
  end

  autoload_under 'models/concerns/metadata/dc' do
    autoload :Abstract
    autoload :AccessRights
    autoload :Available
    autoload :Creator
    autoload :Contributor
    autoload :Date
    autoload :DateAccepted
    autoload :Description
    autoload :Identifier
    autoload :KeywordSubject
    autoload :Language
    autoload :Publisher
    autoload :ResourceType
    autoload :Rights
    autoload :RightsHolder
    # autoload :Title # part of CoreMetadata
    autoload :SimpleVersions
  end

  autoload_under 'models/concerns/metadata/dlib' do
    autoload :CollectionsCategory
    autoload :ForIndexing
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :GenericModuleCode
    autoload :GenericQualifier
    autoload :GenericWorkflow
    autoload :LastAccess
    autoload :MainFile
    autoload :NumberOfDownloads
    autoload :ReadmeFile
  end

  autoload_under 'models/concerns/metadata/edm' do
    autoload :EdmRights
  end

  autoload_under 'models/concerns/metadata/foaf' do
    autoload :FoafName
  end

  autoload_under 'models/concerns/metadata/frbr' do
    autoload :InJournal
  end

  autoload_under 'models/concerns/metadata/lc_identifiers' do
    autoload :Doi
    autoload :Orcid
  end

  autoload_under 'models/concerns/metadata/mads' do
    autoload :MadsRelatedAuthority
  end

  autoload_under 'models/concerns/metadata/marc_relators' do
    autoload :Funder
  end

  autoload_under 'models/concerns/metadata/owl' do
    autoload :OwlSameAs
  end

  autoload_under 'models/concerns/metadata/pure' do
    autoload :Pure
    autoload :ManagingOrganisation
  end

  autoload_under 'models/concerns/metadata/rdf' do
    # RDF and RDFS
    autoload :RdfsSeeAlso
    autoload :RdfType
    autoload :RelatedUrl
    autoload :RdfsLabel
  end

  autoload_under 'models/concerns/metadata/schema' do
    autoload :ContentVersion
    autoload :DatePublished
    autoload :IssueNumber
    autoload :Pagination
    autoload :VolumeNumber
    autoload :AlternateName
  end

  autoload_under 'models/concerns/metadata/skos' do
    autoload :SkosLabels
    autoload :SkosNote
  end

  autoload_under 'models/concerns/metadata/vivo' do
  end

  autoload_under 'models/concerns/metadata/uketd' do
    autoload :Advisor
    autoload :DateOfAward
    autoload :Department
    autoload :Qualification
  end

  autoload_under 'models/concerns/metadata/ulcc' do
    autoload :DateSubmitted
    autoload :ProjectOutput
    autoload :OfficialUrl
    autoload :Refereed
  end

  autoload_under 'models/concerns/behaviours' do
    # Behaviour
    autoload :AddWorkBehaviour
    # Validations
    autoload :ValidateConceptScheme
    autoload :ValidateLabel
    autoload :ValidatePlace
  end

  autoload_under 'models/concerns/indexers' do
    # Indexers
    autoload :IndexesCommon
    autoload :IndexesDataset
    autoload :IndexesCollection
    autoload :IndexesExamPaper
    autoload :IndexesThesis
    autoload :IndexesJournalArticle
  end

  autoload_under 'validators' do
    autoload :LabelValidator
    autoload :PlaceValidator
    autoload :ConceptSchemeMemberValidator
  end
end
