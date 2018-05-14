# frozen_string_literal: true

module DogBiscuits
  module ExtendedSolrDocument
    extend ActiveSupport::Concern

    # Duplicated from https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/solr_document/metadata.rb

    class_methods do
      def attribute(name, type, field)
        define_method name do
          type.coerce(self[field])
        end
      end

      def solr_name(*args)
        Solrizer.solr_name(*args)
      end
    end

    module Solr
      class Array
        # @return [Array]
        def self.coerce(input)
          ::Array.wrap(input)
        end
      end

      class String
        # @return [String]
        def self.coerce(input)
          ::Array.wrap(input).first
        end
      end

      class Date
        # @return [Date]
        def self.coerce(input)
          field = String.coerce(input)
          return if field.blank?
          begin
            ::Date.parse(field)
          rescue ArgumentError
            Rails.logger.info "Unable to parse date: #{field.first.inspect}"
          end
        end
      end
    end

    # TODO: dates
    # TODO sort out the _label ones ... those below are _resource only

    # Keep these alphebetized; comments indicate those in basic_metadata
    #   see https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/solr_document/metadata.rb
    included do
      attribute :abstract, Solr::Array, solr_name('abstract')
      attribute :access_provided_by, Solr::Array, solr_name('access_provided_by')
      attribute :advisor, Solr::Array, solr_name('advisor')
      attribute :awarding_institution, Solr::Array, solr_name('awarding_institution_label')
      # based_near and based_near_label
      attribute :content_version, Solr::Array, solr_name('content_version')
      # contributor
      # creator
      # creator is used by other models so we need to distinguish _label
      # attribute :creator_label, Solr::Array, solr_name('creator_label')
      attribute :date, Solr::Array, solr_name('date')
      attribute :date_accepted, Solr::Array, solr_name('date_accepted')
      attribute :date_available, Solr::Array, solr_name('date_available')
      attribute :date_collected, Solr::Array, solr_name('date_collected')
      attribute :date_copyrighted, Solr::Array, solr_name('date_copyrighted')
      attribute :date_issued, Solr::Array, solr_name('date_issued')
      # date_created
      attribute :date_of_award, Solr::Array, solr_name('date_of_award')
      attribute :date_published, Solr::Array, solr_name('date_published')
      attribute :date_submitted, Solr::Array, solr_name('date_submitted')
      attribute :date_updated, Solr::Array, solr_name('date_updated')
      attribute :date_valid, Solr::Array, solr_name('date_valid')
      attribute :dc_access_rights, Solr::Array, solr_name('dc_access_rights')
      attribute :department, Solr::Array, solr_name('department')
      # description
      attribute :doi, Solr::Array, solr_name('doi')
      attribute :edition, Solr::Array, solr_name('edition')
      attribute :editor, Solr::Array, solr_name('editor')
      attribute :end_date, Solr::Array, solr_name('end_date')
      attribute :extent, Solr::Array, solr_name('extent')
      attribute :dc_format, Solr::Array, solr_name('dc_format')
      attribute :former_identifier, Solr::Array, solr_name('former_identifier')
      attribute :funder, Solr::Array, solr_name('funder')
      attribute :resource_type_general, Solr::Array, solr_name('resource_type_general')
      attribute :has_restriction, Solr::Array, solr_name('has_restriction')
      # rubocop:enable Naming/PredicateName

      # identifier
      attribute :isbn, Solr::Array, solr_name('isbn')
      attribute :issue_number, Solr::Array, solr_name('issue_number')
      # keyword
      # language
      attribute :last_access, Solr::Array, solr_name('last_access')
      # license
      attribute :managing_organisation, Solr::Array, solr_name('managing_organisation_label')
      attribute :module_code, Solr::Array, solr_name('module_code')
      attribute :note, Solr::Array, solr_name('note')
      attribute :number_of_downloads, Solr::Array, solr_name('last_access')
      attribute :official_url, Solr::Array, solr_name('official_url')
      attribute :output_of, Solr::Array, solr_name('output_of')
      attribute :pagination, Solr::Array, solr_name('pagination')
      attribute :part, Solr::Array, solr_name('part')
      attribute :place_of_publication, Solr::Array, solr_name('place_of_publication')
      attribute :presented_at, Solr::Array, solr_name('presented_at')
      attribute :part_of, Solr::Array, solr_name('part_of')
      attribute :project, Solr::Array, solr_name('project_label')
      attribute :publication_status, Solr::Array, solr_name('publication_status')
      # publisher
      attribute :qualification_level, Solr::Array, solr_name('qualification_level')
      attribute :qualification_name, Solr::Array, solr_name('qualification_name')
      attribute :refereed, Solr::Array, solr_name('refereed')
      attribute :related_url, Solr::Array, solr_name('related_url')
      # resource_type
      # rights_statement
      attribute :series, Solr::Array, solr_name('series')
      # source
      attribute :start_date, Solr::Array, solr_name('start_date')
      # subject
      attribute :subtitle, Solr::Array, solr_name('subtitle')
      attribute :volume_number, Solr::Array, solr_name('volume_number')
    end
  end
end
