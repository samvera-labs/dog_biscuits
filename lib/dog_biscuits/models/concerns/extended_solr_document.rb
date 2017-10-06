# frozen_string_literal: true

module DogBiscuits
  # All properties will have a solr_document method
  module ExtendedSolrDocument
    extend ActiveSupport::Concern

    # Keep these alphebetized
    # TODO add tests

    included do
      def abstract
        self[Solrizer.solr_name('abstract')]
      end

      def advisor
        self[Solrizer.solr_name('advisor_label')]
      end

      def awarding_institution
        self[Solrizer.solr_name('awarding_institution_label')]
      end

      def based_near
        self[Solrizer.solr_name('based_near_label')]
      end

      def content_version
        self[Solrizer.solr_name('content_version')]
      end

      def contributor
        self[Solrizer.solr_name('contributor')]
      end

      def creator
        self[Solrizer.solr_name('creator')]
      end

      # creator is used by other models so we need to distinguish _label
      def creator_label
        self[Solrizer.solr_name('creator_label')]
      end

      def date
        self[Solrizer.solr_name('date')]
      end

      def date_accepted
        self[Solrizer.solr_name('date_accepted')]
      end

      def date_available
        self[Solrizer.solr_name('date_available')]
      end

      def date_created
        self[Solrizer.solr_name('date_created')]
      end

      def date_of_award
        self[Solrizer.solr_name('date_of_award')]
      end

      def date_published
        self[Solrizer.solr_name('date_published')]
      end

      def date_submitted
        self[Solrizer.solr_name('date_submitted')]
      end

      def dc_access_rights
        self[Solrizer.solr_name('dc_access_rights')]
      end

      def department
        self[Solrizer.solr_name('department_label')]
      end

      def description
        self[Solrizer.solr_name('description')]
      end

      def doi
        self[Solrizer.solr_name('doi')]
      end

      def edition
        self[Solrizer.solr_name('edition')]
      end

      def editor
        self[Solrizer.solr_name('editor_label')]
      end

      def end_date
        self[Solrizer.solr_name('end_date')]
      end

      def former_identifier
        self[Solrizer.solr_name('former_identifier')]
      end

      def funder
        self[Solrizer.solr_name('funder')]
      end

      # rubocop:disable Naming/PredicateName

      def has_restriction
        self[Solrizer.solr_name('has_restriction')]
      end

      # rubocop:enable Naming/PredicateName

      def identifier
        self[Solrizer.solr_name('identifier')]
      end

      def isbn
        self[Solrizer.solr_name('isbn')]
      end

      def issue_number
        self[Solrizer.solr_name('issue_number')]
      end

      def journal
        self[Solrizer.solr_name('journal')]
      end

      def language
        self[Solrizer.solr_name('language')]
      end

      def last_access
        self[Solrizer.solr_name('last_access')]
      end

      def license
        self[Solrizer.solr_name('license')]
      end

      def managing_organisation
        self[Solrizer.solr_name('managing_organisation_label')]
      end

      def module_code
        self[Solrizer.solr_name('module_code')]
      end

      def note
        self[Solrizer.solr_name('note')]
      end

      def number_of_downloads
        self[Solrizer.solr_name('last_access')]
      end

      def official_url
        self[Solrizer.solr_name('official_url')]
      end

      def pagination
        self[Solrizer.solr_name('pagination')]
      end

      def part
        self[Solrizer.solr_name('part')]
      end

      def place_of_publication
        self[Solrizer.solr_name('place_of_publication')]
      end

      def presented_at
        self[Solrizer.solr_name('presented_at_label')]
      end

      def proceeding
        self[Solrizer.solr_name('proceeding')]
      end

      def project
        self[Solrizer.solr_name('project_label')]
      end

      def publication_status
        self[Solrizer.solr_name('publication_status')]
      end

      def publisher
        self[Solrizer.solr_name('publisher')]
      end

      def qualification_level
        self[Solrizer.solr_name('qualification_level')]
      end

      def qualification_name
        self[Solrizer.solr_name('qualification_name')]
      end

      def refereed
        self[Solrizer.solr_name('refereed')]
      end

      def related_url
        self[Solrizer.solr_name('related_url')]
      end

      def resource_type
        self[Solrizer.solr_name('resource_type')]
      end

      def rights_statement
        self[Solrizer.solr_name('rights_statement')]
      end

      def series
        self[Solrizer.solr_name('series')]
      end

      def source
        self[Solrizer.solr_name('source')]
      end

      def start_date
        self[Solrizer.solr_name('start_date')]
      end

      def subject
        self[Solrizer.solr_name('subject')]
      end

      def volume_number
        self[Solrizer.solr_name('volume_number')]
      end
    end
  end
end
