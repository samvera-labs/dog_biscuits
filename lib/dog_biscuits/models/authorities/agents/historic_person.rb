module DogBiscuits
  # person
  # this is not a RWO, could say #rwo is the RWO
  class HistoricPerson < DogBiscuits::Person
    include DogBiscuits::BorthwickNote,
            DogBiscuits::FoafNameParts,
            DogBiscuits::HubDates

    # TODO create preflabel

    type [::RDF::URI.new('http://schema.org/Person'),
          ::RDF::URI.new('http://vocab.getty.edu/ontology#PersonConcept'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person,
         ]

    # ::RDF::URI.new('http://purl.org/vra/Person')

    # in VRA this includes family as well as individual (use group)
    # vra:hasCulture
    # vra:name == foaf.name
    # vra:birthDate
    # vra:deathDate

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
  end
end
