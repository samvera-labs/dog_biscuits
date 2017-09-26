# frozen_string_literal: true

module DogBiscuits
  class PublishedWorkIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesPublishedWork
  end
end
