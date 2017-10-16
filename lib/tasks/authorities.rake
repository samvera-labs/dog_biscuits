# frozen_string_literal: true

namespace :dog_biscuits do
  namespace :authorities do
    desc 'Create a table-based authority with a file containing a list of subjects.
          The file must contain a list of terms to add, each on a new line.
          A URI will be constructed like so: http://hostname/authority/uri-ified_label
          '
    task :subjects_from_file, [:path] => [:environment] do |_t, args|
      @hostname = `hostname`.delete("\n")
      @authority = 'subjects'
      if args[:path].nil?
        puts 'Supply the path to a file containing a list of subjects, with each subject on a separate line.'
        puts "rake dog_biscuits:authorities['/tmp/my_file.txt']"
      else
        subjects = Qa::LocalAuthority.find_or_create_by(name: @authority)
        File.readlines(args[:path]).each do |line|
          create_record(line.delete("\n"), subjects)
        end
      end
    end

    private

      # Create an authority record in the given local authority
      #
      # @param label [String] the label
      # @param authority [LocalAuthority] the authority to add the record to
      def create_record(label, authority)
        Qa::LocalAuthorityEntry.create(local_authority: authority,
                                       label: cleanup_label(label),
                                       uri: construct_uri(label))
      rescue ActiveRecord::RecordNotUnique
        Rails.logger.warn("Duplicate record: #{label}")
      end

      # Replace &amp; with &
      #
      # @param label [String] the label for cleanup
      # @return [String] cleaned up label
      def cleanup_label(label)
        label.gsub('&amp;', '&')
      end

      # Create a version of the label for use as a uri:
      #   remove all non-alphanumeric characters
      #   trim to 50 characters and replace whitespace with a dash
      #
      # @param label [String] the label for uri-ification
      # @return [String] uri-ified label
      def uri_ifiy_label(label)
        cleanup_label(label).gsub(/[^\w\s\d]/, '')[0..50].parameterize
      end

      # Create a default URI for the term
      #
      # @param label [String] the label for cleanup
      # @return [String] cleaned up label
      def construct_uri(label)
        @hostname ||= "example.com" if @hostname.blank? || @hostname.include?('localhost')
        "http://#{@hostname}/#{@authority}/#{uri_ifiy_label(label)}"
      end
  end
end
