# frozen_string_literal: true
module DogBiscuitsHelper
  # TODO: better comments
  # Return the label for publication status
  #
  # @param value [String]
  # @return [String]
  def publication_status(value)
    if value.is_a? String
      publication_status_label(status)
    elsif value.is_a? Hash
      value[:value].map { |status| publication_status_label(status) }
    end
  end

  def publication_status_label(value)
    service = AuthorityService::PublicationStatusesService.new
    service.label(value)
  rescue KeyError
    value
  end

  # TODO: doc and test
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
end
