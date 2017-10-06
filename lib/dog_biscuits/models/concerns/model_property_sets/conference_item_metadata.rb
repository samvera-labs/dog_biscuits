# frozen_string_literal: true

module DogBiscuits
  module ConferenceItemMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::Abstract
    include DogBiscuits::Available
    include DogBiscuits::DatePublished
    include DogBiscuits::DateSubmitted
    include DogBiscuits::DateAccepted
    include DogBiscuits::Editor
    include DogBiscuits::Isbn
    include DogBiscuits::OfficialUrl
    include DogBiscuits::Pagination
    include DogBiscuits::PlaceOfPublication
    include DogBiscuits::PublicationStatus
    include DogBiscuits::Refereed
    include DogBiscuits::InProceeding
    include DogBiscuits::PresentedAt
    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
