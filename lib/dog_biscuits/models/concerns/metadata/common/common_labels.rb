# frozen_string_literal: true

module DogBiscuits
  # add preflabel, rdfs_label
  # dc:title is included in RequiredMetadata
  module CommonLabels
    extend ActiveSupport::Concern
    include DogBiscuits::SkosLabels
  end
end
