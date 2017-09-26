# frozen_string_literal: true

module DogBiscuits
  module AddWorkBehaviour
    extend ActiveSupport::Concern

    include Hyrax::WorkBehavior
    # TODO: deal with the double loading of these in a Hyrax app
    # include only what we need from Hyrax::WorkBehavior
    # include ::Hydra::Works::WorkBehavior
    # include ::Hyrax::Noid
    # include ::Hyrax::CoreMetadata # for title; changing to CoreMetadata in Hyrax 2
    # Without these, tests fail for indexers
    # include ::Hyrax::HasRepresentative
    # include ::Hyrax::InAdminSet
    # include ::Hyrax::Suppressible
    # include GlobalID::Identification

    # include Hyrax::HumanReadableType
    # include Hyrax::Permissions
    # include Hyrax::Serializers
    # include Hydra::WithDepositor
    # include Solrizer::Common
    # include Hyrax::WithFileSets
    # include Hyrax::Naming
    # include Hydra::AccessControls::Embargoable
    # include Hyrax::NestedWorks # RuntimeError: Circular dependency detected in calling app
    # include Hyrax::ProxyDeposit
    # include Works::Trophies
    # include Works::Metadata
    # include Works::Featured
    # include Hyrax::WithEvents
  end
end
