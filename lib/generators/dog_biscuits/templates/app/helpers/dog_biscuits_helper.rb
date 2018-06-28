module DogBiscuitsHelper
  # TODO better comments
  # Return the label for publication status
  #
  # @param value [String]
  # @return [String]
  def publication_status(value)
    if value.is_a? String
      publication_status_label(status)
    elsif value.is_a? Hash
      value[:value].map { |status| publication_status_label(status) }
    else
      nil
    end
  end

  def publication_status_label(value)
    service = AuthorityService::PublicationStatusesService.new
    service.label(value)
    rescue KeyError
      value
  end
end
