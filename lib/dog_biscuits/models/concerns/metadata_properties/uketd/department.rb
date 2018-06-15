# frozen_string_literal: true

module DogBiscuits
  module Department
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :department_resource,
                              class_name: 'DogBiscuits::Organisation',
                              predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/uketd#departmentResource')

      property :department, predicate: DogBiscuits::Vocab::Uketd.department do |index|
        index.as :stored_searchable, :facetable
      end
    end
  end
end
