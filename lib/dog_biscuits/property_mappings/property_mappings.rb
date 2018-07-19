# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ModuleLength

module DogBiscuits
  module PropertyMappings
    attr_writer :property_mappings

    # Add all properties to the property_mappings hash.
    # Allowed values:
    #   index: text fragment for inclusion in the catalog_controller index section;
    #     omit label and helper_method as these will be added by the generator using info below
    #   schema_org: hash containing property; can also include type and value
    #   label: a human-readable label for the property (omit if the property name should be used)
    #   help_text: help text to include in the form
    #   render_as: a custom renderer for the field (omit facetable as this will be added by the generator)
    #   helper_method: a helper method used to render this property in the catalog

    # NOTE: Labels MUST be wrapped in single quotes and help_text MUST be wrapped in double quotes
    def property_mappings
      @property_mappings ||=
        {
          file_format: {
            index: "('file_format', :stored_searchable), link_to_search: solr_name('file_format', :facetable)"
          },
          embargo_release_date: {
            index: "('embargo_release_date', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          lease_expiration_date: {
            index: "('lease_expiration_date', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          depositor: {
            index: "('depositor'), helper_method: :link_to_profile",
            label: 'Owner'
          },
          proxy_depositor: {
            index: "('proxy_depositor', :symbol)",
            helper_method: :link_to_profile,
            label: 'Depositor'
          },
          date_uploaded: {
            index: "('date_uploaded', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          date_modified: {
            index: "('date_modified', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          abstract: {
            index: "('abstract', :stored_searchable)",
            # TODO: text_area
            helper_method: :truncate_text_and_iconify_link,
            schema_org: {
              property: "description"
            }
          },
          advisor: {
            index: "('advisor', :stored_searchable)",
            schema_org: {
              property: "contributor",
              type: "http://schema.org/Person",
              value: "name"
            },
            label: 'Advisor / supervisor',
            help_text: 'Thesis advisor or supervisor.'
          },
          access_provided_by: {
            index: "('access_provided_by', :stored_searchable)",
            schema_org: {
              property: "provider",
              type: "http://schema.org/Organization",
              value: "name"
            },
            label: 'Access provided by',
            help_text: 'Repository'
          },
          alt: {
            index: "('alt', :stored_searchable)",
            label: 'Altitude'
          },
          based_near_label: {
            index: "('based_near_label', :stored_searchable), link_to_search: solr_name('based_near_label', :facetable)",
            schema_org: {
              property: "contentLocation",
              type: "http://schema.org/Place",
              value: "name"
            },
            label: 'Location',
            help_text: "A place name related to the work, such as its site of publication, or the city, state, or country the work contents are about. Calls upon the <a href='http://www.geonames.org'>GeoNames web service</a>."
          },
          content_version: {
            index: "('content_version', :stored_searchable)",
            help_text: "The version of the file, eg. Author's Original or Accepted Manuscript."
          },
          contributor: {
            index: "('contributor', :stored_searchable), link_to_search: solr_name('contributor', :facetable)",
            schema_org: {
              property: "contributor",
              type: "http://schema.org/Person",
              value: "name"
            },
            help_text: "A person or group you want to recognize for playing a role in the creation of the work, but not the primary role."
          },
          contributor_combined: {
            index: "('contributor_combined', :stored_searchable), link_to_search: solr_name('contributor_combined', :facetable)",
            schema_org: {
              property: "contributor",
              type: "http://schema.org/Person",
              value: "name"
            },
            label: 'Contributor'
          },
          contributor_type: {
            label: 'Contributor type'
          },
          creator: {
            index: "('creator', :stored_searchable), link_to_search: solr_name('creator', :facetable)",
            label: 'Creator',
            schema_org: {
              property: "creator",
              type: "http://schema.org/Person",
              value: "name"
            },
            help_text: "The person or group responsible for the work. Usually this is the author of the content. Personal names should be entered with the last name first, e.g. &quot;Smith, John.&quot;."
          },
          date: {
            label: 'Date',
            index: "('date', :stored_sortable)",
            helper_method: :human_readable_date,
            help_text: 'A date for the work.'
          },
          date_accepted: {
            index: "('date_accepted', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          date_available: {
            index: "('date_available', :stored_sortable, type: :date)",
            schema_org: {
              property: "datePublished"
            },
            helper_method: :human_readable_date
          },
          date_collected: {
            index: "('date_collected', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date collected'
          },
          date_copyrighted: {
            index: "('date_copyrighted', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date copyrighted'
          },
          date_created: {
            index: "('date_created', :stored_sortable, type: :date)",
            schema_org: {
              property: "dateCreated"
            },
            helper_method: :human_readable_date,
            help_text: "The date on which the work was created."
          },
          date_issued: {
            index: "('date_issued', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date issued'
          },
          # Only used for the date range facet
          date_range: {
            label: 'Date Range'
          },
          date_published: {
            index: "('date_published', :stored_sortable, type: :date)",
            schema_org: {
              property: "datePublished"
            },
            label: 'Publication date',
            helper_method: :human_readable_date
          },
          date_submitted: {
            index: "('date_submitted', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          date_of_award: {
            index: "('date_of_award', :stored_sortable, type: :date)",
            helper_method: :human_readable_date
          },
          date_updated: {
            index: "('date_updated', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date updated'
          },
          date_valid: {
            index: "('date_valid', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date valid'
          },
          dc_access_rights: {
            index: "('dc_access_rights', :stored_searchable)",
            label: 'Access rights'
          },
          department: {
            index: "('department', :stored_searchable)",
            label: 'Department, School or Faculty'
          },
          description: {
            index: "('description', :stored_searchable)",
            label: 'Description or summary',
            # TODO: text_area
            helper_method: :truncate_text_and_iconify_link,
            schema_org: {
              property: "description"
            },
            help_text: "Free-text notes about the work. Examples include abstracts of a paper or citation information for a journal article."
          },
          doi: {
            index: "('doi', :stored_searchable)",
            schema_org: {
              property: "identifier"
            },
            label: 'DOI',
            help_text: 'Digital Object Identifier (DOI) for the work.'
          },
          edition: {
            index: "('edition', :stored_searchable)",
            label: 'Edition',
            schema_org: {
              property: "version"
            }
          },
          editor: {
            index: "('editor', :stored_searchable)",
            label: 'Editor',
            schema_org: {
              property: "editor"
            }
          },
          extent: {
            index: "('extent', :stored_searchable)",
            label: 'Extent'
          },
          event_date: {
            index: "('event_date', :stored_sortable, type: :date)",
            helper_method: :human_readable_date,
            label: 'Date of event'
          },
          dc_format: {
            index: "('dc_format', :stored_searchable)",
            label: 'Format'
          },
          former_identifier: {
            index: "('former_identifier', :stored_searchable)",
            label: 'Former identifier',
            schema_org: {
              property: "identifier"
            },
            help_text: 'A former identifier, URL or other reference for the work.'
          },
          funder: {
            index: "('funder', :stored_searchable)",
            label: 'Funder',
            schema_org: {
              property: "funder"
            },
            help_text: 'Funding body or oraganisation funding the work.'
          },
          has_restriction: {
            index: "('has_restriction', :stored_searchable)",
            label: 'Restriction note'
          },
          human_readable_type: {
            index: "('human_readable_type', :stored_searchable)",
            label: 'Type',
            schema_org: {
              'Conference Item' => 'http://schema.org/ScholarlyArticle',
              'Dataset' => 'http://schema.org/Dataset',
              'Exam Paper' => 'http://schema.org/CreativeWork',
              'Journal Article' => 'http://schema.org/ScholarlyArticle',
              'Package' => 'http://schema.org/Dataset',
              'Published Work' => 'http://schema.org/CreativeWork'
            }
          },
          identifier: {
            index: "('identifier', :stored_searchable), field_name: 'identifier'",
            label: 'Identifier',
            helper_method: :index_field_link,
            schema_org: {
              property: "identifier"
            },
            help_text: "A unique handle identifying the work. An example would be a DOI for a journal article, or an ISBN or OCLC number for a book."
          },
          isbn: {
            index: "('isbn', :stored_searchable)",
            schema_org: {
              property: "identifier"
            },
            label: 'ISBN',
            help_text: 'The International Standard Book Number for the work.'
          },
          issue_number: {
            index: "('issue_number', :stored_searchable)",
            schema_org: {
              property: "issueNumber"
            },
            label: 'Issue'
          },
          journal: {
            index: "('journal', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            },
            label: 'Journal name'
          },
          keyword: {
            index: "('keyword', :stored_searchable), link_to_search: solr_name('keyword', :facetable)",
            label: 'Keywords',
            schema_org: {
              property: "keywords"
            },
            help_text: "Words or phrases you select to describe what the work is about. These are used to search for content."
          },
          language: {
            index: "('language', :stored_searchable), link_to_search: solr_name('language', :facetable)",
            label: 'Language',
            schema_org: {
              property: "language"
            },
            help_text: "The language of the work's content."
          },
          last_access: {
            index: "('last_access', :stored_searchable)"
          },
          lat: {
            index: "('lat', :stored_searchable)",
            label: 'Latitude'
          },
          license: {
            index: "('license', :stored_searchable)",
            label: 'License',
            helper_method: :license_links,
            render_as: :license,
            help_text: "Licensing and distribution information governing access to the work. Select from the provided drop-down list."
          },
          location: {
            index: "('location', :stored_searchable)",
            label: 'Location'
          },
          long: {
            index: "('long', :stored_searchable)",
            label: 'Longitude'
          },
          module_code: {
            index: "('module_code', :stored_searchable)",
            schema_org: {
              property: "identifier"
            },
            label: 'Module code'
          },
          note: {
            index: "('note', :stored_searchable)",
            label: 'Note',
            schema_org: {
              property: "note"
            },
            help_text: "A general note about the work."
          },
          number_of_downloads: {
            index: "('number_of_downloads', :stored_searchable)"
          },
          official_url: {
            index: "('official_url', :stored_searchable)",
            schema_org: {
              property: "significantLink"
            },
            label: 'Official URL',
            render_as: :external_link
          },
          output_of: {
            index: "('output_of', :stored_searchable)",
            label: 'Output of project or grant'
          },
          package_ids: {
            index: "('package_ids', :symbol)",
            label: "Package (AIP/DIP) contains",
            help_text: 'Packages these works. Customarily, the package is a digital preservation AIP or DIP.',
            render_as: :package_ids
          },
          packaged_by_ids: {
            index: "('packaged_by_ids', :symbol)",
            label: "In package (AIP/DIP)",
            help_text: 'Packaged by the following work. Customarily, the package is a digital preservation AIP or DIP.',
            render_as: :packaged_by_ids
          },
          # facet only, not used for display, doesn't need index
          packaged_by_titles: {
            label: "In package"
          },
          pagination: {
            index: "('pagination', :stored_searchable)",
            schema_org: {
              property: "pagination"
            },
            label: 'Pages'
          },
          part: {
            index: "('part', :stored_searchable)",
            label: 'Part name',
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          place_of_publication: {
            index: "('place_of_publication', :stored_searchable)",
            label: 'Place of publication',
            schema_org: {
              property: "location",
              type: "http://schema.org/Place",
              value: "name"
            }
          },
          presented_at: {
            index: "('presented_at', :stored_searchable)",
            label: 'Presented at',
            schema_org: {
              property: "workPerformed",
              type: "http://schema.org/Event",
              value: "name"
            }
          },
          part_of: {
            index: "('proceeding', :stored_searchable)",
            label: 'Part of',
            help_text: "A Work that this this physically or logically contained in, such as a conference proceeding, or series.",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          publication_status: {
            index: "('publication_status', :stored_searchable)",
            label: 'Publication status',
            render_as: 'publication_status',
            helper_method: 'publication_status'
          },
          publisher: {
            index: "('publisher', :stored_searchable), link_to_search: solr_name('publisher', :facetable)",
            schema_org: {
              property: "publisher",
              type: "http://schema.org/Organization",
              value: "name"
            },
            help_text: "The person or group making the work available. Generally this is the institution.",
            label: 'Publisher'
          },
          qualification_level: {
            index: "('qualification_level', :stored_searchable)",
            label: 'Qualification level'
          },
          qualification_name: {
            index: "('qualification_name', :stored_searchable)",
            label: 'Qualification name'
          },
          refereed: {
            index: "('refereed', :stored_searchable)",
            label: 'Peer reviewed?'
          },
          related_url: {
            index: "('related_url', :stored_searchable)",
            schema_org: {
              property: "relatedLink"
            },
            render_as: :external_link,
            help_text: "A link to a website or other specific content (audio, video, PDF document) related to the work. An example is the URL of a research project from which the work was derived.",
            label: 'Related URL'
          },
          resource_type: {
            index: "('resource_type', :stored_searchable), link_to_search: solr_name('resource_type', :facetable)",
            schema_org: {
              'Article' => "http://schema.org/Article",
              'Audio' => "http://schema.org/AudioObject",
              'Book' => "http://schema.org/Book",
              'Conference Proceeding' => "http://schema.org/ScholarlyArticle",
              'Dataset' => "http://schema.org/Dataset",
              'Dissertation' => "http://schema.org/ScholarlyArticle",
              'Image' => "http://schema.org/ImageObject",
              'Map or Cartographic Material' => "http://schema.org/Map",
              'Masters Thesis' => "http://schema.org/ScholarlyArticle",
              'Part of Book' => "http://schema.org/Book",
              'Research Paper' => "http://schema.org/ScholarlyArticle",
              'Software or Program Code' => "http://schema.org/Code",
              'Video' => "http://schema.org/VideoObject"
            },
            label: 'Resource type',
            help_text: "Pre-defined categories to describe the type of content being uploaded, such as &quot;article&quot; or &quot;dataset.&quot;  More than one type may be selected."
          },
          # datacite-specific
          resource_type_general: {
            index: "('resource_type_general', :stored_searchable)",
            schema_org: {
              'Audiovisual' => "http://schema.org/MediaObject",
              'Collection' => "http://bib.schema.org/Collection",
              'DataPaper' => "http://schema.org/CreativeWork",
              'Dataset' => "http://schema.org/Dataset",
              'Event' => "http://schema.org/Event",
              'Image' => "http://schema.org/ImageObject",
              'InteractiveResource' => "http://schema.org/CreativeWork",
              'Model' => "http://schema.org/CreativeWork",
              'PhysicalObject' => "http://schema.org/Thing",
              'Service' => "http://schema.org/Service",
              'Software' => "http://schema.org/Code",
              'Sound' => "http://schema.org/AudioObject",
              'Text' => "http://schema.org/CreativeWork",
              'Workflow' => "http://schema.org/CreativeWork",
              'Other' => "http://schema.org/Thing"
            },
            label: 'General resource type'
          },
          rights_statement: {
            index: "('rights_statement', :stored_searchable)",
            helper_method: :rights_statement_links,
            render_as: :rights_statement,
            label: 'Rights statement'
          },
          series: {
            index: "('series', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            },
            label: 'Series'
          },
          subject: {
            index: "('subject', :stored_searchable), link_to_search: solr_name('subject', :facetable)",
            schema_org: {
              property: "about",
              type: "http://schema.org/Thing",
              value: "name"
            },
            help_text: "Headings or index terms describing what the work is about; these do need to conform to an existing vocabulary.",
            label: 'Subject'
          },
          subtitle: {
            index: "('subtitle', :stored_searchable)",
            schema_org: {
              property: "name"
            },
            label: 'Subtitle'
          },
          title: {
            index: "('title', :stored_searchable), if: false",
            schema_org: {
              property: "name"
            },
            label: 'Title',
            help_text: "A name to aid in identifying a work."
          },
          volume_number: {
            index: "('volume_number', :stored_searchable)",
            schema_org: {
              property: "volumeNumber"
            },
            label: 'Volume'
          },
          aip_uuid: {
            index: "('aip_uuid', :stored_searchable)",
            label: 'AIP UUID'
          },
          transfer_uuid: {
            index: "('transfer_uuid', :stored_searchable)",
            label: 'Transfer UUID'
          },
          sip_uuid: {
            index: "('sip_uuid', :stored_searchable)",
            label: 'SIP UUID'
          },
          dip_uuid: {
            index: "('dip_uuid', :stored_searchable)",
            label: 'DIP UUID'
          },
          aip_status: {
            index: "('aip_status', :stored_searchable)",
            label: 'AIP Status'
          },
          dip_status: {
            index: "('dip_status', :stored_searchable)",
            label: 'DIP Status'
          },
          aip_size: {
            index: "('aip_size', :stored_searchable)",
            label: 'AIP Size'
          },
          dip_size: {
            index: "('dip_size', :stored_searchable)",
            label: 'DIP Size'
          },
          aip_current_path: {
            index: "('aip_current_path', :stored_searchable)",
            label: 'AIP Current Path'
          },
          dip_current_path: {
            index: "('dip_current_path', :stored_searchable)",
            label: 'DIP Current Path'
          },
          aip_current_location: {
            index: "('aip_current_location', :stored_searchable)",
            label: 'AIP Current Location'
          },
          dip_current_location: {
            index: "('dip_current_location', :stored_searchable)",
            label: 'DIP Current Location'
          },
          aip_resource_uri: {
            index: "('aip_resource_uri', :stored_searchable)",
            label: 'AIP Resource URI'
          },
          dip_resource_uri: {
            index: "('dip_resource_uri', :stored_searchable)",
            label: 'DIP Resource URI'
          },
          origin_pipeline: {
            index: "('origin_pipeline', :stored_searchable)",
            label: 'Origin Pipeline'
          }
        }
    end
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ModuleLength
