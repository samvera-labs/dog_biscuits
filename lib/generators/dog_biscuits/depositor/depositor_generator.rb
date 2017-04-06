class DogBiscuits::DepositorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../../templates', __FILE__)

  def inject_into_depositor
    init_path = 'config/initializers/dog_biscuits.rb'
    file_path = 'config/dog_biscuits.yml'
    unless File.exist?(file_path)
      copy_file 'dog_biscuits.yml', file_path
      copy_file 'dog_biscuits.rb', init_path
    end
    # find and replace the depositor value with the supplied value
    gsub_file file_path, /depositor:\s\S{2,}\n/, "depositor: '#{file_name}'\n"
  end
end
