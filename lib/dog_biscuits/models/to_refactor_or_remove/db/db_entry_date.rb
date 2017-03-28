class DbEntryDate < ActiveRecord::Base
  belongs_to :db_entry
  has_many :db_single_dates

  def add_rdf_types
    ['http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate']
  end
end
