# frozen_string_literal: true

module DogBiscuits
  module AddWorkBehaviour
    extend ActiveSupport::Concern

    # include Hyrax::WorkBehavior # include only what we need from Hyrax::WorkBehavior
    include ::Hydra::Works::WorkBehavior
    include ::Hyrax::Noid
    include ::Hyrax::RequiredMetadata # changing to CoreMetadata in Hyrax 2
    # Without these three, tests fail for indexers
    include ::Hyrax::HasRepresentative
    include ::Hyrax::InAdminSet
    include ::Hyrax::Suppressible

    # include HumanReadableType
    # include Permissions
    # include Serializers
    # include Hydra::WithDepositor
    # include Solrizer::Common
    # include WithFileSets
    # include Naming
    # include Hydra::AccessControls::Embargoable
    include GlobalID::Identification
    # include NestedWorks # RuntimeError: Circular dependency detected in calling app
    # include ProxyDeposit
    # include Works::Trophies
    # include Works::Metadata
    # include Works::Featured
    # include WithEvents
  end
end
