module DogBiscuits
  class TermsService < Hyrax::QaSelectService
    attr_reader :authority

    def initialize(*args)
      @authority = self
    end

    # Gets the ConceptScheme
    def terms_id
      parse_terms_id_response(
          SolrQuery.new.solr_query(
              'has_model_ssim:"DogBiscuits::ConceptScheme" AND preflabel_tesim:"' + terms_list + '"'))
    end

    # use preflabel_si to get exact match (string instead of token)
    def all
      sort_order = 'preflabel_si asc'
      parse_authority_response(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '"',
              'id,preflabel_tesim,definition_tesim,broader_ssim',
              1000,
              sort_order))
    end

    def find(id)
      parse_authority_response(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '" AND id:"' + id + '"',
              'id,preflabel_tesim,definition_tesim,broader_ssim'))
    end

    # use preflabel_si to get exact match (string instead of token)
    def find_id(val)
      parse_terms_id_response(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '" AND preflabel_si:"' + val + '"',
              'id'))
    end

    # use preflabel_si to get exact match (string instead of token)
    def find_id_with_alts(val)
      parse_terms_id_response(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '" AND (preflabel_si:"' + val + '" OR altlabel_tesim:"' + val + '")',
              'id'))
    end

    def find_value_string(id)
      parse_string(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '" AND id:"' + id + '"',
              'preflabel_tesim'))
    end

    def search(q)
      parse_authority_response(
          SolrQuery.new.solr_query(
              'inScheme_ssim:"' + terms_id + '" AND preflabel_tesim:"' + q + '"',
              'id,preflabel_tesim,definition_tesim,broader_ssim'))
    end

    # Dereference id into a string for display purposes - e.g. test:101 -> 'abbey'
    def get_str_from_id(id, type)
      response = SolrQuery.new.solr_query('id:"' + id + '"', type, '1')
      parse_terms_response(response, type)
    end
    
    def select_all_options
      authority.all.map { |e| [e[:label], e[:id]] }
    end

    # removed code for same_as and hierarchical schemes, see arch1 if it's needed

    private

    # Reformats the data received from the service
    def parse_authority_response(response)
      response['response']['docs'].map do |result|
        hash = {:id => result['id'],
         :label => if result['preflabel_tesim']
                     result['preflabel_tesim'].join
                   end,
         :definition => if result['definition_tesim']
                          result['definition_tesim'].join
                        end
        }
        # Only add broader where it exists (ie. subjects)
        # assumes only one broader
        if result['broader_ssim']
          hash['broader_id'] = result['broader_ssim'].join
          hash['broader_label'] = find_value_string(result['broader_ssim'].join).join
        end
        hash
      end
    end

    def parse_terms_id_response(response)
      id = ''
      response['response']['docs'].map do |result|
        id = result['id']
      end
      id
    end

    def parse_string(response)
      str = ''
      response['response']['docs'].map do |result|
        str = result['preflabel_tesim']
      end
      str
    end

    # General method to parse ids into strings (py)
    def parse_terms_response(response, type)
      str = ''
      response['response']['docs'].map do |result|
        if result['numFound'] != '0'
          str = result[type]
          if str.class == Array
            str = str.join # 'join' is used to convert an array into a string because otherwise an error occurs
          end
        end
      end
      str
    end
  end
end
