# frozen_string_literal: true

module DogBiscuits
  class TermsService < Hyrax::QaSelectService
    def initialize(_authority = nil)
      @authority = self
    end

    # Returns the ConceptScheme id for a given Scheme name
    #
    # @return id of the ConceptScheme object
    def terms_id
      parse_terms_id_response(
        ActiveFedora::SolrService.get(
          "has_model_ssim:\"DogBiscuits::ConceptScheme\" AND preflabel_tesim:\"#{terms_list} \"",
          {}
        )
      )
    end

    # Returns all items in the authority using preflabel_si to get exact match (string instead of token)
    def all
      sort_order = 'preflabel_si asc'
      parse_authority_response(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\"",
          fl: 'id,preflabel_tesim,definition_tesim,broader_ssim',
          rows: 1000,
          sort: sort_order
        )
      )
    end

    # Find an authority term by id
    #
    # @param id [String] for the requested authority term
    # @return [Hash] all info about the authority
    def find(id)
      parse_authority_response(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\" AND id:\"#{id}\"",
          fl: 'id,preflabel_tesim,definition_tesim,broader_ssim',
          rows: 1
        )
      )
    end

    # Query an authority for a given word or phrase
    #
    # @param q [String] search query
    # @return [Hash] search results
    def search(q)
      parse_authority_response(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\" AND preflabel_tesim:\"#{q}\"",
          fl: 'id,preflabel_tesim,definition_tesim,broader_ssim',
          rows: 1000
        )
      )
    end

    # Find the id for an authority term using preflabel_si to get exact match (string instead of token)
    #
    # @param term [String] the authority term preflabel
    # @return the term id
    def find_id(term)
      parse_terms_id_response(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\" AND preflabel_si:\"#{term}\"",
          fl: 'id',
          rows: 1
        )
      )
    end

    # Find the id for an authority term using preflabel and alt_label (use preflabel_si to get exact match (string instead of token))
    #
    # @param term [String] the authority term preflabel or alt_label
    # @return the term id
    def find_id_with_alts(term)
      parse_terms_id_response(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\" AND (preflabel_si:\"#{term}\" OR altlabel_tesim:\"#{term}\")",
          fl: 'id',
          rows: 1
        )
      )
    end

    # Find an authority term by id
    #
    # @param id [String] for the requested authority term
    # @return [String] the preflabel
    def find_label_string(id)
      parse_string(
        ActiveFedora::SolrService.get(
          "inScheme_ssim:\"#{terms_id}\" AND id:\"#{id}\"",
          fl: 'preflabel_tesim',
          rows: 1
        )
      )
    end

    def select_all_options
      all.map { |e| [e[:label], e[:id]] }
    end

    private

      # Reformats the data received from the service
      #
      # @param response [SolrResponse] for the Solr query
      # @return [Hash] authority data
      def parse_authority_response(response)
        response['response']['docs'].map do |result|
          hash = {
            id: result['id']
          }

          hash[:label] = result['preflabel_tesim'].join if result['preflabel_tesim']
          hash[:definition] = result['definition_tesim'].join if result['definition_tesim']

          # Only add broader where it exists (ie. subjects)
          # Assumes only one broader
          if result['broader_ssim']
            hash[:broader_id] = result['broader_ssim'].join
            hash[:broader_label] = find_label_string(result['broader_ssim'].join).join
          end
          hash
        end
      end

      # Parse the id from the solr response
      #
      # @param response [SolrResponse] for the Solr query
      # @return [String] id
      def parse_terms_id_response(response)
        id = ''
        response['response']['docs'].map do |result|
          id = result['id']
        end
        id
      end

      # Parse the preflabel from the solr response
      #
      # @param response [SolrResponse] for the Solr query
      # @return [String] preflabel
      def parse_string(response)
        str = ''
        response['response']['docs'].map do |result|
          str = result['preflabel_tesim']
        end
        str
      end
  end
end
