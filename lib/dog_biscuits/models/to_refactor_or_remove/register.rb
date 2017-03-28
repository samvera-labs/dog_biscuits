class Register < ActiveFedora::Base
  include DCTerms, RdfType, Hyrax::Noid, Generic, SkosLabels, AssignRdfTypes, ThumbnailUrl
  require 'active_fedora/aggregation'

  has_many :folios, dependent: :destroy
  belongs_to :ordered_collection, predicate: ::RDF::DC.isPartOf
  accepts_nested_attributes_for :folios, allow_destroy: true, reject_if: :all_blank
  ordered_aggregation :folios, through: :list_source
  directly_contains :associated_files, has_member_relation: ::RDF::URI.new('http://pcdm.org/models#hasFile'), class_name: 'ContainedFile'
  contains 'manifest', predicate: ::RDF::URI.new('http://pcdm.org/models#hasFile'), class_name: 'Manifest'

  property :reg_id, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#reference'), multiple: false do |index|
    index.as :stored_searchable, :sortable
  end

  property :access_provided_by, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/accessProvidedBy'), multiple: false do |index|
    index.as :stored_searchable
  end
end
