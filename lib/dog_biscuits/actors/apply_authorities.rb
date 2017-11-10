# frozen_string_literal: true

module DogBiscuits
  module Actors
    module ApplyAuthorities
      private

        # Add new terms to table-based authorities
        #
        # @param env [Hyrax::Actors::Environment] the env
        def apply_authorities(env)
          DogBiscuits.config.authorities_add_new.each do |authority_name|
            term = authority_name.to_s.singularize.to_sym
            next unless env.attributes.key? term
            env.attributes[term].each do |attr|
              add_new(authority_name.to_s, attr)
            end
          end
        end

        # Add new term to the authority; it will be rejected if already present
        #
        # @param auth [String] the authority to add to
        # @param label [String] the label to add
        def add_new(authority_name, label)
          if Qa::Authorities::Local.subauthority_for(authority_name).search(label).empty?
            DogBiscuits::Importers::Authority.new(authority_name).create_record(label)
          end
        rescue Qa::InvalidSubAuthority
          Rails.logger.error("Invalid sub-authority: #{auth}")
        end
    end
  end
end
