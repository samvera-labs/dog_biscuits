module DogBiscuits
  # add journal article metadata
  module AddJournalArticleMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::CommonMetadata,
            DogBiscuits::IssueNumber,
            DogBiscuits::VolumeNumber,
            DogBiscuits::Pagination,
            DogBiscuits::InJournal,
            DogBiscuits::Doi,
            DogBiscuits::PublicationStatus,
            DogBiscuits::Refereed,
            DogBiscuits::Funder,
            DogBiscuits::ProjectOutput,
            DogBiscuits::OfficialUrl,
            DogBiscuits::Available,
            DogBiscuits::DatePublished,
            DogBiscuits::DateSubmitted,
            DogBiscuits::DateAccepted,
            DogBiscuits::ManagingOrganisation,
            DogBiscuits::Department,
            DogBiscuits::Abstract,
            DogBiscuits::Orcid
  end
end
