# frozen_string_literal: true

namespace :dog_biscuits do
  namespace :authorities do
    desc 'Create a table-based authority with a file containing a list of subjects.
          The file must contain a list of labels to add, each on a new line.
          A URI will be constructed like so: http://hostname/authority_name/uri-ified_label
          '
    task :subjects_from_file, [:path] => [:environment] do |_t, args|
      if args[:path].nil?
        puts 'Supply the path to a file containing a list of subjects, with each subject on a separate line.'
        puts "rake dog_biscuits:authorities['/tmp/my_file.txt']"
      else
        subjects = DogBiscuits::Importers::Authorities.new('subjects')
        File.readlines(args[:path]).each do |line|
          subjects.create_record(line.delete("\n"))
        end
      end
    end
  end
end
