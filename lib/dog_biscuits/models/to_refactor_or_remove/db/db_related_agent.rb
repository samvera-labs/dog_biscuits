class DbRelatedAgent < ActiveRecord::Base
  belongs_to :db_entry
  has_many :db_person_as_writtens
  has_many :db_person_roles
  has_many :db_person_descriptors
  has_many :db_person_descriptor_as_writtens
  has_many :db_person_notes
  has_many :db_person_related_places
  has_many :db_person_related_people

  def add_rdf_types_p
    %w(http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedAgent http://xmlns.com/foaf/0.1/Person)
  end

  def add_rdf_types_g
    %w(http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedAgent http://xmlns.com/foaf/0.1/Group)
  end
end
