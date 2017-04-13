# frozen_string_literal: true

FactoryGirl.define do
  factory :file_set, class: DogBiscuits::FileSet do
    preflabel 'fileset'
    content_version ['AM']
  end
end
