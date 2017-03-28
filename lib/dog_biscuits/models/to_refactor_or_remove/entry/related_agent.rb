class RelatedAgent < ActiveFedora::Base
  include Hyrax::Noid, RdfType

  belongs_to :entry, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#relatedAgentFor')

  # Commented out 'dependent => destrpy' because it causes problems when a 'Related Place' is chosen from the drop-down list
  # Basically, deleting a Related Person with such a link results in a 'tombstone' error because of the 'related_place_for' field
  has_many :related_places # , :dependent => :destroy
  accepts_nested_attributes_for :related_places, allow_destroy: true, reject_if: :all_blank

  has_and_belongs_to_many :related_agent, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#relatedAgentFor')

  def add_rdf_types_p
    %w(http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedAgent http://xmlns.com/foaf/0.1/Person http://dlib.york.ac.uk/ontologies/borthwick-registers#All)
  end

  def add_rdf_types_g
    %w(http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedAgent http://xmlns.com/foaf/0.1/Group http://dlib.york.ac.uk/ontologies/borthwick-registers#All)
  end

  property :person_same_as, predicate: ::RDF::URI.new('http://www.w3.org/2002/07/owl#sameAs'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :person_as_written, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#asWritten'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_group, predicate: ::RDF::URI.new('http://schema.org/person_group'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :person_gender, predicate: ::RDF::URI.new('http://schema.org/gender'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :person_role, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#role'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_descriptor, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#descriptor'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_descriptor_as_written, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#descriptorAsWritten'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_note, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#note'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_related_place, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#hasRelatedPlace'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :person_related_person, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#hasRelatedPerson'), multiple: true do |index|
    index.as :stored_searchable
  end
end
