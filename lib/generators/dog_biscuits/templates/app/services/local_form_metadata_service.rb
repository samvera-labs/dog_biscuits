# frozen_string_literal: true
# Answers queries about the cardinality of each field on the form.
class LocalFormMetadataService < Hyrax::FormMetadataService
  # @param [Class] model_class the class of the object
  # @param [Symbol] field the field we want to know about
  # @return [Boolean] true if the passed in field is a multivalued field
  def self.multiple?(model_class, field)
    if DogBiscuits.config.singular_properties.include? field
      false
    else
      # Inquire at the model level
      super
    end
  end
end
