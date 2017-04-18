# frozen_string_literal: true

class DbSingleDate < ActiveRecord::Base
  belongs_to :db_entry_date
  has_many :db_date_certainties

  def add_rdf_types
    ['http://dlib.york.ac.uk/ontologies/borthwick-registers#SingleDate']
  end
end
