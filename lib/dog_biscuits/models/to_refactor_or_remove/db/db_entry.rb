class DbEntry < ActiveRecord::Base
  has_many :db_entry_types
  has_many :db_section_types
  has_many :db_marginalia
  has_many :db_languages
  has_many :db_subjects
  has_many :db_notes
  has_many :db_editorial_notes
  has_many :db_is_referenced_bys
  has_many :db_entry_dates
  has_many :db_related_places
  has_many :db_related_agents

  def add_rdf_types
    %w(http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry http://www.shared-canvas.org/ns/Zone http://pcdm.org/models#Object)
  end
end
