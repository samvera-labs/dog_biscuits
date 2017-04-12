class DogBiscuits::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_authorities
    directory 'authorities', 'config/authorities'
  end

  def inject_into_dog_biscuits
    init_path = 'config/initializers/dog_biscuits.rb'
    file_path = 'config/dog_biscuits.yml'
    unless File.exist?(file_path)
      copy_file 'dog_biscuits.yml', file_path
      copy_file 'dog_biscuits.rb', init_path
    end
    file_content = File.read(init_path)
    text = File.read(file_path)
    ::DogBiscuits::Terms.constants.each do |term|
      t = term.to_s
      term_string = "Qa::Authorities::Local.register_subauthority('#{t.gsub('Terms', '').underscore.downcase}s', 'DogBiscuits::Terms::#{t}')"
      unless file_content.include? term_string
        inject_into_file init_path, after: '# include Terms' do
          "\n#{term_string}"
        end
      end
      next if text.include? t
      inject_into_file file_path, after: '# authorities' do
        "\n#{t.gsub('Terms', '').underscore.pluralize}: \"\""
      end
    end
  end

  def inject_into_authority_service
    file_path = 'app/services/authority_service.rb'
    copy_file 'authority_service.rb', file_path

    ::DogBiscuits::Terms.constants.each do |term|
      t = term.to_s
      term_string = "\n\tclass #{t.gsub('Terms', '')}Service < DogBiscuits::Terms::#{t}\n\t\tinclude ::LocalAuthorityConcern\n\tend"
      inject_into_file file_path, after: '# Object based' do
        term_string
      end
    end

    Dir.entries('config/authorities').each do |file|
      next unless file.end_with?('.yml')
      term_string = "\n\tclass #{file.gsub('.yml', '').camelize}Service < Hyrax::QaSelectService\n\tinclude ::FileAuthorityConcern\n\t\tdef initialize\n\t\t\tsuper('#{file.gsub('.yml', '')}')\n\t\tend\n\tend"
      inject_into_file file_path, after: '# File based' do
        term_string
      end
    end
  end

  def copy_local_quthority_concern
    copy_file 'local_authority_concern.rb', 'app/services/concerns/local_authority_concern.rb'
  end

  def copy_file_authority_concern
    copy_file 'file_authority_concern.rb', 'app/services/concerns/file_authority_concern.rb'
  end
end
