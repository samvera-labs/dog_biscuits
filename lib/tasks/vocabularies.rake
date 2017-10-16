namespace :dog_biscuits do
  namespace :vocabularies do

    # TODO do we care about &amp;

    desc 'Create a table-based authority with the given file. The file must contain a list of terms to add, each on a new line.'
    task subjects_from_file: :environment do
      Qa::LocalAuthority.find_or_create_by(name: 'subjects')
      File.readlines('subjects.txt').each do |line|
        #create_record(line, 'subjects')
        puts cleanup_label(line)
      end
    end

    private

    # Create an authority record in the given local authority
    #
    # @param label [String] the label
    # @param authority [String] the name of the authority
    def create_record(label, authority)
      Qa::LocalAuthorityEntry.create(local_authority: authority,
                                     label: label,
                                     uri: construct_uri_for_label(label))
    rescue ActiveRecord::RecordNotUnique
      Rails.logger.warn("Duplicate record: #{label}")
    end

    # Create a version of the label for use as a uri
    #   remove &amp;
    #   remove all other non-alphanumeric characters
    #   trim to 50 characters
    #   replace whitespace with a dash
    #
    # @param label [String] the label for cleanup
    # @return [String] cleaned up label
    def cleanup_label(label)
      label.gsub('&amp;', '&').gsub(/[^\w\s\d]/, '')[0..50].parameterize
    end

    def construct_uri_for_label(label)
      @uri ||= 'http://example.com/'
      "#{@uri}#{cleanup_label(label)}"
    end
  end
end
