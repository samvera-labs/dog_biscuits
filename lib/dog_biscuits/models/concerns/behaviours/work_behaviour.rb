# frozen_string_literal: true

module DogBiscuits
  module WorkBehaviour
    extend ActiveSupport::Concern

    # In order to be used, the work classes require various 'Behaviors' from Hyrax
    # In Hyrax, this is included like so:
    #     include Hyrax::WorkBehavior

    # When using these models within a Hyrax application, the WorkBehavior mixin is added to the model
    # We can also include it here, but that means 'double-loading'
    # Also, Hyrax::NestedWorks is one of the mixins included in WorkBehavior and this will cause an error:
    #   RuntimeError: Circular dependency detected in calling app

    # The approach taken is *not* to include behavior within DogBiscuits, but instead leave it to the calling Hyrax
    # application to do so.

    # For spec tests, these are performed on the generated model in Hyrax *not* on the DogBiscuits model

    # For information, this is the current set of include statements from Hyrax::WorkBehavior:
    # include ::Hydra::Works::WorkBehavior
    # include ::Hyrax::CoreMetadata
    # include ::Hyrax::HasRepresentative
    # include ::Hyrax::InAdminSet
    # include ::Hyrax::Suppressible
    # include GlobalID::Identification
    # include Hydra::AccessControls::Embargoable
    # include Hyrax::HumanReadableType
    # include Hyrax::Permissions
    # include Hyrax::Serializers
    # include Hydra::WithDepositor
    # include Solrizer::Common
    # include Hyrax::WithFileSets
    # include Hyrax::Naming
    # include Hyrax::NestedWorks # RuntimeError: Circular dependency detected in calling app
    # include Hyrax::ProxyDeposit
    # include ::Works::Trophies
    # include ::Works::Metadata
    # include ::Works::Featured
    # include Hyrax::WithEvents
    # include ::Hyrax::Noid
  end
end
