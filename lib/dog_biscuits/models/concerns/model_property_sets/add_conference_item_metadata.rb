# frozen_string_literal: true

module DogBiscuits
  module AddConferenceItemMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Abstract
    include DogBiscuits::Available
    include DogBiscuits::DatePublished
    include DogBiscuits::DateSubmitted
    include DogBiscuits::DateAccepted
    include DogBiscuits::Editor
    include DogBiscuits::Isbn
    include DogBiscuits::OfficialUrl
    include DogBiscuits::ManagingOrganisation
    include DogBiscuits::Pagination
    include DogBiscuits::PlaceOfPublication
    include DogBiscuits::PublicationStatus
    include DogBiscuits::Refereed
    include DogBiscuits::OriginDate
    include DogBiscuits::InProceeding
    include DogBiscuits::PresentedAt
  end
end
