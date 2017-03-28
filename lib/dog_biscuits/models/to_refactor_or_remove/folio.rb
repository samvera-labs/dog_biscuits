require 'active_fedora/noid'

class Folio < ActiveFedora::Base
  include DCTerms, RdfType, Hyrax::Noid, Generic, SkosLabels, AssignRdfTypes

  belongs_to :register, predicate: ::RDF::DC.isPartOf
  has_many :entries # , :dependent => :destroy
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :entry, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank
  directly_contains :images, has_member_relation: ::RDF::URI.new('http://pcdm.org/models#hasMember'), class_name: 'Image'
  contains 'canvas', predicate: ::RDF::URI.new('http://pcdm.org/models#hasFile'), class_name: 'Canvas'

  # Adding a lot of relationships (eg. hasMember) with has_and_belongs_to_many causes an error (solr query too large);
  # use has_many and a property instead;
  # or a reciprocal belongs_to (like isPartOf)
  # also won't delete
  # or directly contains like I have done now
  # has_and_belongs_to_many :images, predicate: ::RDF::URI.new('http://pcdm.org/models#hasFile')

  property :folio_type, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#folioType'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :folio_no, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#folioNo'), multiple: false do |index|
    index.as :stored_searchable, :sortable
  end

  property :folio_face, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#folioFace'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :blank, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#isBlank'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :missing, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#isMissing'), multiple: false do |index|
    index.as :stored_searchable
  end
end
