# frozen_string_literal: true

class Entry < ActiveFedora::Base
  include Generic, RdfType, AssignRdfTypes

  belongs_to :folio, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#folio')

  has_many :related_agents, dependent: :destroy
  has_many :related_places, dependent: :destroy
  has_many :entry_dates, dependent: :destroy

  accepts_nested_attributes_for :related_agents, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :related_places, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :entry_dates, allow_destroy: true, reject_if: :all_blank

  property :entry_no, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#entryNo'), multiple: false do |index|
    index.as :stored_searchable, :sortable
  end

  property :entry_type, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#entryType'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :section_type, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#sectionType'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :marginalia, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#marginalia'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :summary, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#summary'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :language, predicate: ::RDF::URI.new('http://purl.org/dc/terms/language'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :subject, predicate: ::RDF::URI.new('http://purl.org/dc/terms/subject'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :note, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#note'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :editorial_note, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#editorial_note'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :is_referenced_by, predicate: ::RDF::URI.new('http://purl.org/dc/terms/is_referenced_by'), multiple: true do |index|
    index.as :stored_searchable
  end

  property :continues_on, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/borthwick-registers#continuesOn'), multiple: false do |index|
    index.as :stored_searchable
  end
end
