# frozen_string_literal: true

FactoryGirl.define do
  factory :collection, class: DogBiscuits::Collection do
    description ['description']
    creator ['Marr, Johnny']
    date ['2016-01-01']
    language ['English']
    language_code ['en-GB']
    keyword ['northern misery']
    subject ['Official Heading for Woe']
    rights_holder ['Johnny Marr']
    license ['https://creativecommons.org/publicdomain/mark/1.0/']
    rights_statement ['http://rightsstatements.org/vocab/InC/1.0/']
    rights_description ['some additoinal stuff about rights']
  end
end
