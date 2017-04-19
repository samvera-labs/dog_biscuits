# frozen_string_literal: true

module DogBiscuits
  class HistoricPerson < DogBiscuits::Person
    before_save :add_label

    type [::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person,
          DogBiscuits::Vocab::BorthwickRegisters.HistoricPerson]

    # Eg. NCA Rules 2.5C.
    property :pre_title, predicate: DogBiscuits::Vocab::Generic.preTitle,
                         multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCA Rules 2.5B.
    property :post_title,
             predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/title'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCA Rules 2.5D.
    property :epithet,
             predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/epithet'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    property :dates_of_office,
             predicate: DogBiscuits::Vocab::Generic.datesOfOffice,
             multiple: false do |index|
      index.as :stored_searchable
    end

    def historic_person?
      true
    end

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      label = ''
      label += ", #{family_name}" if family_name.present?
      label += ", #{pre_title}" if pre_title.present?
      label += ", #{given_name}" if given_name.present?
      label += ", #{dates}" if dates.present?
      label += ", #{post_title}" if post_title.present?
      label += ", #{epithet}" if epithet.present?
      label = label.sub(', ', '') if label.starts_with? ', '
      self.rdfs_label = label
      add_preflabel
    end
  end
end
