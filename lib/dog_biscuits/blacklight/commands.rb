# frozen_string_literal: true
# From JiscRDSS/rdss-samvera
#   https://github.com/JiscRDSS/rdss-samvera/blob/master/willow/app/controllers/blacklight/concerns/commands.rb
#   Copyright Jisc
module DogBiscuits
  module Blacklight
    module Commands
      extend ActiveSupport::Concern

      include DogBiscuits::Solr::IndexTypes

      class_methods do
        private

          def decode_name_and_options(name, options = {})
            actual_name = name.keys.first
            values = name.values.first
            labelled_name = values[:name] || actual_name
            index_type = values[:as] || :stored_searchable
            solr_options = values[:type] && [{ type: values[:type] }] || nil
            options.merge!(values[:options] || {})
            [actual_name, labelled_name, index_type, solr_options, options]
          end

          def default_label(name)
            I18n.t('dog_biscuits.fields.' + name.to_s)
          end

          def default_label_options(name)
            { label: default_label(name) }
          end

          def default_index_options(name, index_type = :facetable)
            { itemprop: name, link_to_search: send("#{index_type}_name", name) }
          end

          def index_options(name, mapping)
            return {} unless mapping
            opts = {}
            mapping[:index]&.each do |opt|
              opts[opt.keys.first] = index_option_value(name, opt.keys.first, opt[opt.keys.first])
            end
            opts[:itemprop] = mapping[:schema_org][:property] if mapping[:schema_org]
            opts[:helper_method] = mapping[:helper_method] if mapping[:helper_method]
            { options: opts }
          end

          def index_option_value(name, key, value)
            if key == :link_to_search && value == true
              index_type = :facetable
              send("#{index_type}_name", name)
            else
              value
            end
          end

          def send_to_configuration(config, name, config_type, default_index_type, options = {})
            name, label_name, index_type, solr_options, options = if name.is_a?(Hash)
                                                                    decode_name_and_options(name, options)
                                                                  else
                                                                    [name, name, default_index_type, nil, options]
                                                                  end
            begin
              config.send("add_#{config_type}", send("#{index_type}_name", name, *solr_options), default_label_options(label_name).merge(options))
            rescue ArgumentError
              Rails.logger("solr_options are: #{solr_options.inspect}")
              raise
            end
          end

          def add_labelled_facet_field(config, name, options)
            send_to_configuration(config, name, :facet_field, :facetable, options)
          end

          def add_labelled_index_field(config, name, options = {})
            send_to_configuration(config, name, :index_field, :stored_searchable, options)
          end

          def add_labelled_show_field(config, name, options = {})
            send_to_configuration(config, name, :show_field, :stored_searchable, options)
          end

          def add_solr_search_field(config, name, options = {})
            name, label_name, index_type, solr_options, _options = if name.is_a?(Hash)
                                                                     decode_name_and_options(name, options)
                                                                   else
                                                                     [name, name, :stored_searchable, options]
                                                                   end
            local_params_solr_name = send("#{index_type}_name", name, *solr_options)
            config.add_search_field(name.to_s) do |field|
              field.label = default_label(label_name)
              field.solr_local_parameters = { qf: local_params_solr_name, pf: local_params_solr_name }
            end
          end

          def add_facet_field(config, names, options = { limit: 5 })
            names.each { |name| add_labelled_facet_field(config, name, options) }
          end

          def add_index_field(config, names)
            names.each { |name| add_labelled_index_field(config, name) }
          end

          def add_show_field(config, names)
            names.each { |name| add_labelled_show_field(config, name) }
          end

          def add_search_field(config, names)
            names.each { |name| add_solr_search_field(config, name) }
          end

          def to_searchable_names_field_list(names)
            names.map { |name| stored_searchable_name(name) }.join(' ')
          end
      end
    end
  end
end
