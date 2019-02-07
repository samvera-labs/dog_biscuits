# frozen_string_literal: true
module DogBiscuitsHelper
  # Generic helper where the field name is a singular version of the authority name,
  #  eg. publication_status and publication_statuses
  # Returns the label for the value from QA
  #
  # @param value [String] or [Hash]
  # @return [String]
  def term_label(value)
    if value.is_a? String
      term_label_from_id(value)
    elsif value.is_a? Hash
      value[:value].map { |v| term_label_from_id(v) }
    end
  end

  def term_label_from_id(value, service = nil)
    field = @field unless @field.blank?
    service ||= "AuthorityService::#{field.to_s.pluralize.camelize}Service".constantize.new
    service.label(value)
  rescue KeyError
    value
  end

  def truncate_text_and_iconify_link(value)
    if value.is_a? String
      iconify_auto_link(truncate_text(value).to_s)
    elsif value.is_a? Hash
      value[:value] = value[:value].map { |text| truncate_text(text).to_s }
      iconify_auto_link(value)
    end
  end

  def truncate_text_and_iconify_link(value)
    if value.is_a? String
      iconify_auto_link(truncate_text(value).to_s)
    elsif value.is_a? Hash
      value[:value] = value[:value].map { |text| truncate_text(text).to_s }
      iconify_auto_link(value)
    end
  end

  def truncate_text(text)
    text.truncate_words(50, omission: ' ...')
  end
  
  def restricted?(term)
    return false if DogBiscuits.config.restricted_properties_enabled == false
    # evaluate restriction
    (
      DogBiscuits.config.restricted_properties.include?(term) && 
        current_user.send("#{DogBiscuits.config.restricted_role}?") == true
    ) || !DogBiscuits.config.restricted_properties.include?(term)
  end
end
