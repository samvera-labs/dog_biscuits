# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ModuleLength

module DogBiscuits
  module PropertyMappings
    attr_writer :property_mappings

    # Add all properties to the property_mappings hash.
    # Allowed values:
    #   label: a human-readable label for the property REQUIRED
    #   index: any additional options for the blacklight index in an array
    #     excluding helper_method and item prop
    #     provide in a hash, eg. [{ if: false }], or [{ link_to_search: true }]
    #     nb. for link_to_search, just provide true
    #   schema_org: hash containing property; can also include type and value
    #   help_text: help text to include in the form
    #   render_as: a custom renderer for the field (omit facetable)
    #   helper_method: a helper method used to render this property in the catalog

    # NOTE: Labels MUST be wrapped in single quotes and help_text MUST be wrapped in double quotes
    def property_mappings
      @property_mappings ||=
        {
          file_format: {
            label: 'File format',
            index: [{ link_to_search: true }]
          },
          embargo_release_date: {
            label: 'Embargo releases on',
            index: [{ type: :date }],
            helper_method: :human_readable_date
          },
          lease_expiration_date: {
            label: 'Lease expires on',
            index: [{ type: :date }],
            helper_method: :human_readable_date
          },
          depositor: {
            helper_method: :link_to_profile,
            label: 'Owner'
          },
          proxy_depositor: {
            # index: "('proxy_depositor', :symbol",
            helper_method: :link_to_profile,
            label: 'Depositor'
          },
          date_uploaded: {
            label: 'Date uploaded',
            helper_method: :human_readable_date
          },
          date_modified: {
            label: 'Date modified',
            helper_method: :human_readable_date
          },
          abstract: {
            label: 'Abstract',
            helper_method: :truncate_text_and_iconify_link,
            schema_org: {
              property: "description"
            }
          },
          access_restrictions: {
            label: 'Access Restrictions',
          },
          advisor: {
            schema_org: {
              property: "contributor",
              type: "http://schema.org/Person",
              value: "name"
            },
            label: 'Advisor / supervisor',
            help_text: 'Thesis advisor or supervisor.'
          },
          access_provided_by: {
            schema_org: {
              property: "provider",
              type: "http://schema.org/Organization",
              value: "name"
            },
            label: 'Access provided by',
            help_text: 'Repository'
          },
          alt: {
            label: 'Altitude'
          },
          archival_level: {
            label: 'Archival level',
            render_as: 'term_label',
            helper_method: 'term_label'
          },
          awarding_institution: {
            index: [{ link_to_search: true }],
            label: 'Awarding institution'
          },
          based_near: {
            index: [{ link_to_search: true }],
            schema_org: {
              property: "contentLocation",
              type: "http://schema.org/Place",
              value: "name"
            },
            label: 'Location',
            help_text: "A place name related to the work, such as its site of publication, or the city, state, or country the work contents are about. Calls upon the <a href='http://www.geonames.org'>GeoNames web service</a>."
          },
          based_near_label: {
            index: [{ link_to_search: true }],
            schema_org: {
              property: "contentLocation",
              type: "http://schema.org/Place",
              value: "name"
            },
            label: 'Location',
            help_text: "A place name related to the work, such as its site of publication, or the city, state, or country the work contents are about. Calls upon the <a href='http://www.geonames.org'>GeoNames web service</a>."
          },
          brand: {
            label: 'Brand',
          },
          content_version: {
            help_text: "The version of the file, eg. Author's Original or Accepted Manuscript."
          },
          contributor: {
            index: [{ link_to_search: true }],
            schema_org: {
              property: "contributor",
              type: "http://schema.org/Person",
              value: "name"
            },
            label: 'Contributor',
            help_text: "A person or group you want to recognize for playing a role in the creation of the work, but not the primary role."
          },
          contributor_combined: {
            index: [{ link_to_search: true }],
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
            index: [{ link_to_search: true }],
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
            help_text: 'A date for the work.'
          },
          dates: {
            label: 'Dates',
            help_text: 'The date of creation. May be in the form of text or numbers, and may consist of a single date or range of dates.'
          },
          date_accepted: {
            label: 'Date accepted'
          },
          date_available: {
            schema_org: {
              property: "datePublished"
            }
          },
          date_collected: {
            label: 'Date collected'
          },
          date_copyrighted: {
            label: 'Date copyrighted'
          },
          date_created: {
            schema_org: {
              property: "dateCreated"
            },
            help_text: "The date on which the work was created."
          },
          date_issued: {
            label: 'Date issued'
          },
          # Only used for the date range facet
          date_range: {
            label: 'Dates'
          },
          date_published: {
            schema_org: {
              property: "datePublished"
            },
            label: 'Publication date'
          },
          date_submitted: {
            label: 'Date submitted'
          },
          date_of_award: {
            label: 'Date of award'
          },
          date_updated: {
            helper_method: :human_readable_date
          },
          date_valid: {
            label: 'Date valid'
          },
          dc_access_rights: {
            label: 'Access rights'
          },
          department: {
            label: 'Department, School or Faculty'
          },
          description: {
            label: 'Description or summary',
            helper_method: :truncate_text_and_iconify_link,
            schema_org: {
              property: "description"
            },
            help_text: "Free-text notes about the work. Examples include abstracts of a paper or citation information for a journal article."
          },
          doi: {
            schema_org: {
              property: "identifier"
            },
            label: 'DOI',
            help_text: 'Digital Object Identifier (DOI) for the work.'
          },
          edition: {
            label: 'Edition',
            schema_org: {
              property: "version"
            }
          },
          editor: {
            label: 'Editor',
            schema_org: {
              property: "editor"
            }
          },
          example_of_work: {
            label: 'Example of work'
          },
          extent: {
            label: 'Extent'
          },
          event_date: {
            label: 'Date of event'
          },
          start_date: {
            label: 'Start date'
          },
          end_date: {
            label: 'End date'
          },
          dc_format: {
            label: 'Format'
          },
          former_identifier: {
            label: 'Former identifier',
            schema_org: {
              property: "identifier"
            },
            help_text: 'A former identifier, URL or other reference for the work.'
          },
          funder: {
            label: 'Funder',
            schema_org: {
              property: "funder"
            },
            help_text: 'Funding body or oraganisation funding the work.'
          },
          has_dao_ids: {
            label: "Has Digital Objects",
            render_as: :link_to_id
          },
          has_restriction: {
            label: 'Restriction note'
          },
          height: {
            label: 'Height'
          },
          human_readable_type: {
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
            label: 'Identifier',
            helper_method: :index_field_link,
            schema_org: {
              property: "identifier"
            },
            help_text: "A unique handle identifying the work. An example would be a DOI for a journal article, or an ISBN or OCLC number for a book."
          },
          in_archival_resource_ids: {
            label: "Belongs to Archival Item",
            render_as: :link_to_id
          },
          in_archival_resource_title: {
            label: "Belongs to Archival Item"
          },
          isbn: {
            schema_org: {
              property: "identifier"
            },
            label: 'ISBN',
            help_text: 'The International Standard Book Number for the work.'
          },
          issue_number: {
            schema_org: {
              property: "issueNumber"
            },
            label: 'Issue'
          },
          journal: {
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            },
            label: 'Journal name'
          },
          keyword: {
            index:  [{ link_to_search: true }],
            label: 'Keywords',
            schema_org: {
              property: "keywords"
            },
            help_text: "Words or phrases you select to describe what the work is about. These are used to search for content."
          },
          language: {
            index:  [{ link_to_search: true }],
            label: 'Language',
            schema_org: {
              property: "language"
            },
            help_text: "The language of the work's content."
          },
          last_access: {
            label: 'Date of last access'
          },
          lat: {
            label: 'Latitude'
          },
          license: {
            label: 'License',
            helper_method: :license_links,
            render_as: :license,
            help_text: "Licensing and distribution information governing access to the work. Select from the provided drop-down list."
          },
          location: {
            label: 'Location'
          },
          long: {
            label: 'Longitude'
          },
          managing_organisation: {
            label: 'Managing organisation'
          },
          module_code: {
            schema_org: {
              property: "identifier"
            },
            label: 'Module code'
          },
          note: {
            label: 'Note',
            schema_org: {
              property: "note"
            },
            help_text: "A general note about the work."
          },
          number_of_downloads: {
            label: 'Number of downloads'
          },
          official_url: {
            schema_org: {
              property: "significantLink"
            },
            label: 'Official URL',
            render_as: :external_link
          },
          output_of: {
            label: 'Output of project or grant'
          },
          package_ids: {
            label: "Package contains",
            help_text: 'Packages these works. Customarily, the package is a digital preservation AIP or DIP.',
            render_as: :link_to_id
          },
          packaged_by_ids: {
            label: "In package",
            help_text: 'Packaged by the following work. Customarily, the package is a digital preservation AIP or DIP.',
            render_as: :link_to_id
          },
          packaged_by_titles: {
            label: "In package"
          },
          pagination: {
            schema_org: {
              property: "pagination"
            },
            label: 'Pages'
          },
          part: {
            label: 'Part name',
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          place_of_publication: {
            label: 'Place of publication',
            schema_org: {
              property: "location",
              type: "http://schema.org/Place",
              value: "name"
            }
          },
          presented_at: {
            label: 'Presented at',
            schema_org: {
              property: "workPerformed",
              type: "http://schema.org/Event",
              value: "name"
            }
          },
          part_of: {
            label: 'Part of',
            help_text: "A Work that this this physically or logically contained in, such as a conference proceeding, or series.",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          publication_status: {
            label: 'Publication status',
            render_as: 'term_label',
            helper_method: 'term_label'
          },
          publisher: {
            index: [{ link_to_search: true }],
            schema_org: {
              property: "publisher",
              type: "http://schema.org/Organization",
              value: "name"
            },
            help_text: "The person or group making the work available. Generally this is the institution.",
            label: 'Publisher'
          },
          qualification_level: {
            label: 'Qualification level'
          },
          qualification_name: {
            label: 'Qualification name'
          },
          refereed: {
            label: 'Peer reviewed?'
          },
          release_date: {
            label: 'Release date',
            schema_org: {
              property: "releaseDate"
            }
          },
          related_url: {
            schema_org: {
              property: "relatedLink"
            },
            render_as: :external_link,
            help_text: "A link to a website or other specific content (audio, video, PDF document) related to the work. An example is the URL of a research project from which the work was derived.",
            label: 'Related URL'
          },
          resource_type: {
            index: [{ link_to_search: true }],
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
            helper_method: :rights_statement_links,
            render_as: :rights_statement,
            label: 'Rights statement'
          },
          series: {
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            },
            label: 'Series'
          },
          source: {
            label: 'Source'
          },
          subject: {
            index: [{ link_to_search: true }],
            schema_org: {
              property: "about",
              type: "http://schema.org/Thing",
              value: "name"
            },
            help_text: "Headings or index terms describing what the work is about; these do need to conform to an existing vocabulary.",
            label: 'Subject'
          },
          subtitle: {
            schema_org: {
              property: "name"
            },
            label: 'Subtitle'
          },
          title: {
            index: [{ if: false }],
            schema_org: {
              property: "name"
            },
            label: 'Title',
            help_text: "A name to aid in identifying a work."
          },
          volume_number: {
            schema_org: {
              property: "volumeNumber"
            },
            label: 'Volume'
          },
          width: {
            label: 'Width'
          },
          # Archivematica terms
          aip_uuid: {
            label: 'AIP UUID'
          },
          transfer_uuid: {
            label: 'Transfer UUID'
          },
          sip_uuid: {
            label: 'SIP UUID'
          },
          dip_uuid: {
            label: 'DIP UUID'
          },
          aip_status: {
            label: 'AIP Status'
          },
          dip_status: {
            label: 'DIP Status'
          },
          aip_size: {
            label: 'AIP Size'
          },
          dip_size: {
            label: 'DIP Size'
          },
          aip_current_path: {
            label: 'AIP Current Path'
          },
          dip_current_path: {
            label: 'DIP Current Path'
          },
          aip_current_location: {
            label: 'AIP Current Location'
          },
          dip_current_location: {
            label: 'DIP Current Location'
          },
          aip_resource_uri: {
            label: 'AIP Resource URI'
          },
          dip_resource_uri: {
            label: 'DIP Resource URI'
          },
          origin_pipeline: {
            label: 'Origin Pipeline'
          }
        }
    end
  end
end

# rubocop:enable Metrics/LineLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ModuleLength
