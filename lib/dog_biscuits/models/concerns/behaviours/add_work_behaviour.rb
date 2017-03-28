module DogBiscuits
  module AddWorkBehaviour
    extend ActiveSupport::Concern
    # include Hyrax::WorkBehavior
    # These are what WorkBehavior includes - include only what we need:
    include ::Hydra::Works::WorkBehavior
    include ::Hyrax::Noid
    include ::Hyrax::RequiredMetadata
    # include ::Hyrax::HumanReadableType
    # include ::Hyrax::Permissions
    # include ::Hyrax::Serializers
    # include ::Hydra::WithDepositor
    # include ::Solrizer::Common
    include ::Hyrax::HasRepresentative
    # include ::Hyrax::WithFileSets
    # include ::Hyrax::Naming
    include Hyrax::InAdminSet
    # include ::Hydra::AccessControls::Embargoable
    # include ::GlobalID::Identification
    include ::Hyrax::Suppressible
    # RuntimeError: Circular dependency detected while autoloading constant Thesis
    # In CC app
    # include Hyrax::NestedWorks
  end
end