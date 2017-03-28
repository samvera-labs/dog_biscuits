module DogBiscuits
  # Project
  class Project < Authority

    include DogBiscuits::CommonLabels,
            DogBiscuits::FoafName,
            DogBiscuits::GenericAuthorityTerms,
            DogBiscuits::Identifier,
            DogBiscuits::Funder,
            Hyrax::Noid

    before_save :add_preflabel

    type [::RDF::URI.new('http://xmlns.com/foaf/0.1/Project')]

    def project?
      true
    end
    def agent?
      false
    end
    def concept?
      false
    end

    def add_preflabel
      unless name.blank?
        self.preflabel = name
        self.preflabel += " (id: #{identifier.join})" unless identifier.blank?
      end
    end

  end
end
