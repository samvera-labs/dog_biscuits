module DogBiscuits
  class Package < Work
    include DogBiscuits::AddPackageMetadata

    # belongs_to - one only; has_and_belongs_to_many - lots
    has_and_belongs_to_many :packages,
                            class_name: 'DogBiscuits::Work',
                            predicate: DogBiscuits::Vocab::Generic.packages,
                            inverse_of: :packaged_by

    type << DogBiscuits::Vocab::Generic.Package

    before_save :add_types

    property :requestor_email, predicate: DogBiscuits::Vocab::Generic.requestorEmail, multiple: true do |index|
      index.as :stored_searchable
    end

    def package?
      true
    end

    def aip?
      if aip_uuid.nil?
        false
      else
        true
      end
    end

    def dip?
      if dip_uuid.nil?
        false
      else
        true
      end
    end

    # If DIP/AIP has been created, add the rdf type
    def add_types
      unless dip_uuid.nil?
        rdf_type << DogBiscuits::Vocab::OaisArchivematica.DisseminationInformationPackage
      end
      unless aip_uuid.nil?
        rdf_type << DogBiscuits::Vocab::OaisArchivematica.ArchivalInformationPackage
      end
    end
  end
end
