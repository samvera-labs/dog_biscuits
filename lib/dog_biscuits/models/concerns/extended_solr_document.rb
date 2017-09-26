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

      def content_version
        self[Solrizer.solr_name('content_version')]
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

      def date_of_award
        self[Solrizer.solr_name('date_of_award')]
      end

      def date_published
        self[Solrizer.solr_name('date_published')]
      end

      def date_submitted
        self[Solrizer.solr_name('date_submitted')]
      end

      def department
        self[Solrizer.solr_name('department_label')]
      end

      def doi
        self[Solrizer.solr_name('doi')]
      end

      def edition
        self[Solrizer.solr_name('edition')]
      end

      def editor
        self[Solrizer.solr_name('editor')]
      end

      def funder
        self[Solrizer.solr_name('funder')]
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

      def managing_organisation
        self[Solrizer.solr_name('managing_organisation_label')]
      end

      def note
        self[Solrizer.solr_name('note')]
      end

      def official_url
        self[Solrizer.solr_name('official_url')]
      end

      def origin_date
        self[Solrizer.solr_name('origin_date')]
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
        self[Solrizer.solr_name('presented_at')]
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

      def qualification_level
        self[Solrizer.solr_name('qualification_level')]
      end

      def qualification_name
        self[Solrizer.solr_name('qualification_name')]
      end

      def refereed
        self[Solrizer.solr_name('refereed')]
      end

      def series
        self[Solrizer.solr_name('series')]
      end

      def volume_number
        self[Solrizer.solr_name('volume_number')]
      end
    end
  end
end
