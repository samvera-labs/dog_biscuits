# frozen_string_literal: true

class DogBiscuits::AuthorityGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc '
This generator makes the following changes to your application:
  1. Copies authorities into config/authorities.
  2. Registers all subauthorities in config/intitializers/dog_biscuits.rb
  3. Sets up references to the authority concept_schemes in config/dog_biscuits.yml
  4. Copies the authority services into app/services/
       '

  def copy_authorities
    directory 'config/authorities', 'config/authorities'
  end

  def create_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    yml_path = 'config/dog_biscuits.yml'

    copy_file 'config/dog_biscuits.yml', yml_path unless File.exist?(yml_path)
    copy_file 'config/initializers/dog_biscuits.rb', init_path unless File.exist?(init_path)
  end

  def inject_into_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    yml_path = 'config/dog_biscuits.yml'

    init_content = File.read(init_path)
    yml_content = File.read(yml_path)

    ::DogBiscuits::Terms.constants.each do |term|
      t = term.to_s
      term_string = "Qa::Authorities::Local.register_subauthority('#{t.gsub('Terms', '').underscore.downcase}', 'DogBiscuits::Terms::#{t}')"
      unless init_content.include? term_string
        inject_into_file init_path, after: '# include Terms' do
          "\n#{term_string}"
        end
      end
      next if yml_content.include? t
      inject_into_file yml_path, after: '# authorities' do
        "\n#{t.gsub('Terms', '').underscore.pluralize}: \"\""
      end
    end
  end

  def authority_service
    template('authority_service.rb.erb', 'app/services/authority_service.rb')
  end

  def copy_concerns
    directory 'app/services/concerns', 'app/services/concerns'
  end
end
