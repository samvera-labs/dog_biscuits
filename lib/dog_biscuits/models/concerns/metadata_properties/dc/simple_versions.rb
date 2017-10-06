# frozen_string_literal: true

module DogBiscuits
  module SimpleVersions
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :replaced_by,
                              class_name: name.to_s,
                              predicate: ::RDF::Vocab::DC.isReplacedBy,
                              inverse_of: :replaces
      has_and_belongs_to_many :replaces,
                              class_name: name.to_s,
                              predicate: ::RDF::Vocab::DC.replaces,
                              inverse_of: :replaced_by
    end
  end
end
