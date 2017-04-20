# frozen_string_literal: true

module DogBiscuits
  module ReadmeFile
    extend ActiveSupport::Concern

    included do
      before_save :add_member_fs

      property :readme, predicate: DogBiscuits::Vocab::Generic.readme,
                        multiple: false do |index|
        index.as :stored_searchable
      end

      # Use for the the link to a readme file
      has_and_belongs_to_many :readmefile,
                              class_name: 'DogBiscuits::FileSet',
                              predicate: DogBiscuits::Vocab::Generic.hasReadmeFile

      # Add the FileSet to the members if it has not already been added.
      def add_member_fs
        members << readmefile.first unless readmefile.empty? || members.include?(readmefile.first)
      end
    end
  end
end
