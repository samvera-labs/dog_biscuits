module DogBiscuits
  # readme text or readme file
  module ReadmeFile
    extend ActiveSupport::Concern

    included do
      # TODO make this multiple
      property :readme, predicate: DogBiscuits::Vocab::Generic.readme,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Use for the the link to a readme file
      has_and_belongs_to_many :readmefile,
                              class_name: 'DogBiscuits::FileSet',
                              predicate: DogBiscuits::Vocab::Generic.hasReadmeFile
      # An alternative approach is a dedicated FileSet.
      # Currently Curation Concerns only allow a single FileSet.
      # filters_association :members, as: :readme, condition: :readme?
      # Ensure the FileSet is added to the members
      before_save :add_member_fs

      # TODO remove duplication with main file? could use classname
      # Add the FileSet to the members if it has not been added.
      def add_member_fs
        unless self.readmefile.empty?
          unless self.members.include? self.readmefile.first
            self.members << self.readmefile.first
          end
        end
      end
    end
  end
end
