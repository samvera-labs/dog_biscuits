# frozen_string_literal: true

module DogBiscuits
  # add journal article metadata
  module AddJournalArticleMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::IssueNumber
    include DogBiscuits::VolumeNumber
    include DogBiscuits::Pagination
    include DogBiscuits::InJournal
    include DogBiscuits::Doi
    include DogBiscuits::PublicationStatus
    include DogBiscuits::Refereed
    include DogBiscuits::Funder
    include DogBiscuits::ProjectOutput
    include DogBiscuits::OfficialUrl
    include DogBiscuits::Available
    include DogBiscuits::DatePublished
    include DogBiscuits::DateSubmitted
    include DogBiscuits::DateAccepted
    include DogBiscuits::ManagingOrganisation
    include DogBiscuits::Department
    include DogBiscuits::Abstract
    include DogBiscuits::Orcid
  end
end
