# frozen_string_literal: true

module DogBiscuits
  module InformationResourceMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::Brand
    include DogBiscuits::ReleaseDate

    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
