# frozen_string_literal: true

FactoryGirl.define do
  factory :file_set, class: DogBiscuits::FileSet do
    title ['fileset']
    content_version ['AM']
  end
end
