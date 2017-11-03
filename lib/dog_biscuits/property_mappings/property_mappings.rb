# frozen_string_literal: true
# frozen_string_literal: true

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
            helper_method: :iconify_auto_link,
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
            help_text: 'A summary or abstract for the work.'
          },
          based_near_label: {
            index: "('based_near_label', :stored_searchable), link_to_search: solr_name('based_near_label', :facetable)",
            schema_org: {
              property: "contentLocation",
              type: "http://schema.org/Place",
              value: "name"
            }
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
            }
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
            label: 'Contributor Type'
          },
          creator: {
            index: "('creator', :stored_searchable), link_to_search: solr_name('creator', :facetable)",
            schema_org: {
              property: "creator",
              type: "http://schema.org/Person",
              value: "name"
            }
          },
          date: {
            label: 'Date',
            index: "('date', :stored_sortable)",
            help_text: 'A date for the work.'
          },
          date_accepted: {
            index: "('date_accepted', :stored_sortable, type: :date)"
          },
          date_available: {
            index: "('date_available', :stored_sortable, type: :date)",
            schema_org: {
              property: "datePublished"
            }
          },
          date_created: {
            index: "('date_created', :stored_sortable, type: :date)",
            schema_org: {
              property: "dateCreated"
            }
          },
          date_published: {
            index: "('date_published', :stored_sortable, type: :date)",
            schema_org: {
              property: "datePublished"
            }
          },
          date_submitted: {
            index: "('date_submitted', :stored_sortable, type: :date)"
          },
          date_of_award: {
            index: "('date_of_award', :stored_sortable, type: :date)"
          },
          dc_access_rights: {
            index: "('dc_access_rights', :stored_searchable)",
            label: "Access Rights"
          },
          description: {
            index: "('description', :stored_searchable)",
            helper_method: :iconify_auto_link,
            schema_org: {
              property: "description"
            }
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
            schema_org: {
              property: "version"
            }
          },
          editor: {
            index: "('editor', :stored_searchable)",
            schema_org: {
              property: "editor"
            }
          },
          former_identifier: {
            index: "('former_identifier', :stored_searchable)",
            schema_org: {
              property: "identifier"
            },
            help_text: 'A former identifier, URL or other reference for the work.'
          },
          has_restriction: {
            index: "('has_restriction', :stored_searchable)"
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
            helper_method: :index_field_link,
            schema_org: nil,
            property: "identifier"
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
            }
          },
          journal: {
            index: "('journal', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          keyword: {
            index: "('keyword', :stored_searchable), link_to_search: solr_name('keyword', :facetable)",
            schema_org: {
              property: "keywords"
            }
          },
          language: {
            index: "('language', :stored_searchable), link_to_search: solr_name('language', :facetable)",
            schema_org: {
              property: "language"
            }
          },
          last_access: {
            index: "('last_access', :stored_searchable)"
          },
          license: {
            index: "('license', :stored_searchable)",
            helper_method: :license_links,
            render_as: :license
          },
          module_code: {
            index: "('module_code', :stored_searchable)",
            schema_org: {
              property: "identifier"
            }
          },
          note: {
            index: "('note', :stored_searchable)",
            schema_org: {
              property: "note"
            },
            help_text: 'A general note about the work.'
          },
          number_of_downloads: {
            index: "('number_of_downloads', :stored_searchable)"
          },
          official_url: {
            index: "('official_url', :stored_searchable)",
            schema_org: {
              property: "significantLink"
            },
            render_as: :external_link
          },
          pagination: {
            index: "('pagination', :stored_searchable)",
            schema_org: {
              property: "pagination"
            }
          },
          part: {
            index: "('part', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          place_of_publication: {
            index: "('place_of_publication', :stored_searchable)",
            schema_org: {
              property: "location",
              type: "http://schema.org/Place",
              value: "name"
            }
          },
          presented_at: {
            index: "('presented_at', :stored_searchable)",
            schema_org: {
              property: "workPerformed",
              type: "http://schema.org/Event",
              value: "name"
            }
          },
          proceeding: {
            index: "('proceeding', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          publication_status: {
            index: "('publication_status', :stored_searchable)"
          },
          publisher: {
            index: "('publisher', :stored_searchable), link_to_search: solr_name('publisher', :facetable)",
            schema_org: {
              property: "publisher",
              type: "http://schema.org/Organization",
              value: "name"
            }
          },
          qualification_level: {
            index: "('qualification_level', :stored_searchable)"
          },
          qualification_name: {
            index: "('qualification_name', :stored_searchable)"
          },
          refereed: {
            index: "('refereed', :stored_searchable)"
          },
          related_url: {
            index: "('related_url', :stored_searchable)",
            schema_org: {
              property: "relatedLink"
            },
            render_as: :external_link
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
            }
          },
          rights_statement: {
            index: "('rights_statement', :stored_searchable)",
            helper_method: :rights_statement_links,
            # render_as: :rights_statement
          },
          series: {
            index: "('series', :stored_searchable)",
            schema_org: {
              property: "isPartOf",
              type: "http://schema.org/CreativeWork",
              value: "name"
            }
          },
          subject: {
            index: "('subject', :stored_searchable), link_to_search: solr_name('subject', :facetable)",
            schema_org: {
              property: "about",
              type: "http://schema.org/Thing",
              value: "name"
            }
          },
          title: {
            index: "('title', :stored_searchable), if: false",
            schema_org: {
              property: "name"
            }
          },
          volume_number: {
            index: "('volume_number', :stored_searchable)",
            schema_org: {
              property: "volumeNumber"
            }
          }
        }
    end
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ModuleLength
