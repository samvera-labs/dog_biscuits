class EntryDate < ActiveFedora::Base
  include Hyrax::Noid, RdfType, AssignRdfTypes

  belongs_to :entry, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#entryDateFor')
  has_many :single_dates, dependent: :destroy
  accepts_nested_attributes_for :single_dates, allow_destroy: true, reject_if: :all_blank

  property :date_role, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#role'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :date_note, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#note'), multiple: false do |index|
    index.as :stored_searchable
  end
end
