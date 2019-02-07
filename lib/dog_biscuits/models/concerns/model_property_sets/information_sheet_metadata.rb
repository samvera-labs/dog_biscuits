# frozen_string_literal: true

module DogBiscuits
  module InformationSheetMetadata
    extend ActiveSupport::Concern

    include DogBiscuits::Brand
    include DogBiscuits::Product
    include DogBiscuits::ReleaseDate

    # Controlled Properties must go last
    include DogBiscuits::CommonMetadata
  end
end
