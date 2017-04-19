# frozen_string_literal: true

module DogBiscuits
  # agents, people and organisations extend this
  class Agent < Authority
    # HyBox
    include DogBiscuits::FoafName
    include DogBiscuits::AlternateName
    include DogBiscuits::IdentifiedBy
    include DogBiscuits::CommonLabels
    include DogBiscuits::Description
    # Additional
    include DogBiscuits::OwlSameAs
    include DogBiscuits::GenericAuthorityTerms
    include DogBiscuits::MadsRelatedAuthority
    include Hyrax::Noid

    before_save :add_label

    type [::RDF::Vocab::FOAF.Agent]

    property :email, predicate: ::RDF::Vocab::FOAF.mbox,
                     multiple: true do |index|
      index.as :stored_searchable
    end

    # foaf:OnlineAccount
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

    def add_label
      self.rdfs_label = name if name.present?
      add_preflabel
    end

    def add_preflabel
      self.preflabel = rdfs_label
    end
  end
end
