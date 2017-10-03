# frozen_string_literal: true

module DogBiscuits
  class Event < Authority
    include DogBiscuits::FoafName
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::Identifier
    include DogBiscuits::Funder
    include DogBiscuits::StartDate
    include DogBiscuits::EndDate
    include DogBiscuits::Location

    type [::RDF::URI.new('http://schema.org/Event')]

    # TODO add proper indexing

    def agent?
      false
    end

    def concept?
      false
    end

    def concept_scheme?
      false
    end

    def group?
      false
    end

    def organisation?
      false
    end

    def person?
      false
    end

    def place?
      false
    end

    def project?
      false
    end

    def event?
      true
    end

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      self.rdfs_label = name if name.present?
      if self.start_date.present? and self.end_date.present?
        self.rdfs_label += " (#{self.start_date.first} - #{self.end_date.first})"
      elsif self.start_date.present?
        self.rdfs_label += " (#{self.start_date.first})"
      elsif self.end_date.present?
        self.rdfs_label += " (#{self.end_date.first})"
      end
      add_preflabel
    end

    # Generate a preflabel from rdfs label.
    def add_preflabel
      self.preflabel = rdfs_label
    end

    id_blank = proc { |attributes| attributes[:id].blank? }
    class_attribute :controlled_properties
    self.controlled_properties = [:location]
    accepts_nested_attributes_for :location, reject_if: id_blank, allow_destroy: true
  end
end
