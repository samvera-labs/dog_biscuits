# frozen_string_literal: true

module DogBiscuits
  module AddBookMetadata
    extend ActiveSupport::Concern
    include DogBiscuits::AddPublishedWorkMetadata
  end
end
