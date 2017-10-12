# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength

module DogBiscuits
  class Configuration
    include PropertyMappings

    # TODO: valid_child_concerns
    # TODO mix of string and symbol could be confusing

    def available_models
      ['conference_item', 'exam_paper', 'journal_article', 'published_work', 'thesis', 'dataset', 'package'].freeze
    end

    # Default required properties.
    def required_properties
      %i[title creator keyword rights_statement].freeze
    end

    # Basic Metadata properties from Hyrax
    # Omitting bibliographic_citation
    def base_properties
      %i[title creator contributor description keyword license rights_statement publisher date_created subject language identifier based_near related_url resource_type source].freeze
    end

    # Common properties from DogBiscuits atop those in BasicMetadata
    # Also include resource_type which is part of BasicMetadata but not part of the Hyrax WorkForm
    # omitting managing_organisation_resource, department_resource, funder_resource
    # omitting date as this is purely for faceting
    def common_properties
      %i[doi former_identifier note].freeze
    end

    attr_writer :selected_models
    def selected_models
      @selected_models ||= available_models
    end

    # All solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #   The properties must have been indexed as facetable
    # The existing fields will be replaced:
    #   resource_type, creator, tag, subject, language, based_near_label, publisher, file_format
    attr_writer :facet_properties
    # omitting funder
    def facet_properties
      @facet_properties ||= ['human_readable_type', 'resource_type', 'creator', 'contributor_combined', 'contributor_type', 'publisher', 'date',
                             'keyword', 'subject', 'language', 'based_near_label', 'journal', 'proceeding',
                             'qualification_level', 'qualification_name', 'refereed', 'publication_status', 'content_version']
    end

    # *All* solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    # The existing fields will be replaced so must be included here:
    #   title, description, tag, subject, creator, contributor, publisher, based_near_label, language,
    #   date_uploaded, date_modified, date_created, rights, resource_type, format, identifier, extent
    #   embargo_release_date, lease_expiration_date
    attr_writer :index_properties
    def index_properties
      @index_properties ||= %i[
        title
        creator
        publisher
        contributor_combined
        date
        keyword
        subject
        resource_type
        rights_statement
        license
        language
        depositor
        proxy_depositor
        embargo_release_date
        lease_expiration_date
      ]
    end

    # ConferenceItem

    # Properties in order:
    #   basic metadata (as per Hyrax),
    #   conference item (alphebetized),
    #   remaining common properties and resource_type (alphebeized)
    attr_writer :conference_item_properties

    def conference_item_properties
      properties = %i[abstract
                      date_published
                      date_available
                      date_accepted
                      date_submitted
                      editor
                      isbn
                      official_url
                      pagination
                      place_of_publication
                      publication_status
                      presented_at
                      proceeding
                      refereed]
      @conference_item_properties ||= base_properties + properties + common_properties
    end

    attr_writer :conference_item_properties_required

    def conference_item_properties_required
      @conference_item_properties_required ||= required_properties
    end

    # PublishedWork

    attr_writer :published_work_properties
    def published_work_properties
      properties = %i[abstract
                      date_published
                      date_available
                      date_accepted
                      date_submitted
                      edition
                      editor
                      isbn
                      issue_number
                      official_url
                      pagination
                      part
                      place_of_publication
                      publication_status
                      refereed
                      series
                      volume_number]
      @published_work_properties ||= base_properties + properties + common_properties
    end

    attr_writer :published_work_properties_required

    def published_work_properties_required
      @published_work_properties_required ||= required_properties
    end

    attr_writer :journal_article_properties

    # omitting project_resource
    def journal_article_properties
      properties = %i[abstract
                      date_published
                      date_available
                      date_accepted
                      date_submitted
                      issue_number
                      journal
                      official_url
                      pagination
                      publication_status
                      refereed
                      volume_number]
      @journal_article_properties ||= base_properties + properties + common_properties
    end

    attr_writer :journal_article_properties_required

    def journal_article_properties_required
      @journal_article_properties_required ||= required_properties
    end

    attr_writer :thesis_properties
    # omitting awarding_institution_resource orcid
    def thesis_properties
      properties = %i[abstract
                      advisor
                      date_of_award
                      qualification_level
                      qualification_name]
      @thesis_properties ||= base_properties + properties + common_properties
    end

    attr_writer :thesis_properties_required

    def thesis_properties_required
      @thesis_properties_required ||= required_properties
    end

    attr_writer :exam_paper_properties

    def exam_paper_properties
      properties = %i[module_code
                      qualification_level
                      qualification_name
                      date_available]
      @exam_paper_properties ||= base_properties + properties + common_properties
    end

    attr_writer :exam_paper_properties_required

    def exam_paper_properties_required
      @exam_paper_properties_required ||= required_properties
    end

    attr_writer :dataset_properties

    # omitting pure (_uuid, _creation, _type and _link)
    def dataset_properties
      properties = %i[date_available
                      dc_access_rights
                      has_restriction
                      last_access
                      number_of_downloads]
      @dataset_properties ||= base_properties + properties + common_properties
    end

    attr_writer :dataset_properties_required

    def dataset_properties_required
      @dataset_properties_required ||= required_properties
    end

    attr_writer :package_properties

    # omitting properties
    def package_properties
      properties = %i[]
      @package_properties ||= base_properties + properties + common_properties
    end

    attr_writer :package_properties_required

    def package_properties_required
      @package_properties_required ||= required_properties
    end

    # attr_writer :creator_class
    #
    # def creator_class
    #   @creator_class ||= String
    # end
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
