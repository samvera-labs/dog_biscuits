# frozen_string_literal: true

module DogBiscuits
  # People, Groups and Organisations inherit from this.
  class Agent < Authority
    # HyBox
    include DogBiscuits::AlternateName
    include DogBiscuits::Description
    include DogBiscuits::FoafName
    include DogBiscuits::IdentifiedBy
    # Additional
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::MadsRelatedAuthority
    include DogBiscuits::OwlSameAs
    include Hyrax::Noid

    before_save :add_label

    type [::RDF::Vocab::FOAF.Agent]

    property :email, predicate: ::RDF::Vocab::FOAF.mbox,
                     multiple: true do |index|
      index.as :stored_searchable
    end

    # value should be foaf:OnlineAccount
    property :account, predicate: ::RDF::Vocab::FOAF.account,
                       multiple: true do |index|
      index.as :stored_searchable
    end

    property :homepage, predicate: ::RDF::Vocab::FOAF.homepage,
                        multiple: true do |index|
      index.as :stored_searchable
    end

    def agent?
      true
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

    # Generate a rdfs label from the name parts. Overwrite the existing label.
    def add_label
      self.rdfs_label = name if name.present?
      add_preflabel
    end

    # Generate a preflabel from rdfs label.
    def add_preflabel
      self.preflabel = rdfs_label if rdfs_label.present?
    end
  end
end
