class OrderedCollection < ActiveFedora::Base
  include Hyrax::Noid, RdfType, DCTerms, SkosLabels, AssignRdfTypes
  require 'active_fedora/aggregation'

  has_many :registers # do not destroy
  # has_many :ordered_collections # do not destroy
  # has_many :proxies, :dependent => :destroy
  # accepts_nested_attributes_for :proxies, :allow_destroy => true, :reject_if => :all_blank # ???
  ordered_aggregation :registers, through: :list_source
  # ordered_aggregation :ordered_collection, through: :list_source

  # use for collections in the context of archives
  property :coll_id, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#reference'), multiple: false do |index|
    index.as :stored_searchable, :sortable
  end
end
