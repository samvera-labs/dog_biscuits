# frozen_string_literal: true

FactoryGirl.define do
  factory :concept_scheme, class: DogBiscuits::ConceptScheme do
    preflabel 'label'
    altlabel  ['alternative label']
    description ['description']
  end

  factory :departments, class: DogBiscuits::ConceptScheme do
    preflabel 'departments'
  end

  factory :groups, class: DogBiscuits::ConceptScheme do
    preflabel 'groups'
  end

  factory :organisations, class: DogBiscuits::ConceptScheme do
    preflabel 'organisations'
  end

  factory :people, class: DogBiscuits::ConceptScheme do
    preflabel 'people'
  end

  factory :places, class: DogBiscuits::ConceptScheme do
    preflabel 'places'
  end

  factory :projects, class: DogBiscuits::ConceptScheme do
    preflabel 'projects'
  end

  factory :subjects, class: DogBiscuits::ConceptScheme do
    preflabel 'subjects'
  end

  factory :concept, class: DogBiscuits::Concept do
    association :concept_scheme, factory: :concept_scheme, strategy: :build
    preflabel 'label'
    altlabel ['alternative label']
    definition 'my definition is this'
    note ['note']
    approved 'true'
    rules 'nca'
    used 'true'
    same_as %w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212]
    close_match ['uri-to-close-matching-concept']
    exact_match ['uri-to-exact-matching-concept']

    # after(:build, &:map_labels)
    #
    # trait :with_before_save_callback do
    #   after(:build, &:map_labels)
    # end
  end

  factory :simple_concept, class: DogBiscuits::Concept do
    preflabel 'miserabilism'
  end

  factory :broader_concept, class: DogBiscuits::Concept do
    preflabel 'broader object'
  end

  factory :seealso_concept, class: DogBiscuits::Concept do
    preflabel 'seealso object'
  end

  factory :top_concept, class: DogBiscuits::Concept do
    association :top_concept_of, factory: :concept_scheme, strategy: :build
  end

  factory :project, class: DogBiscuits::Project do
    preflabel 'A scientific study into misery'
    name 'A scientific study into misery'
    identifier ['identifier_test']
    funder ['funder']
  end

  factory :agent, class: DogBiscuits::Agent do
    rdfs_label 'Not Factory'
    name 'The Smiths'
    alternate_name ['Ziggy Stardust']
    email ['factory@hacienda.com']
    homepage ['factory.com']
    description ['a description of the factory']
    identified_by ['identified_by']
    account ['online_account']
  end

  factory :person, class: DogBiscuits::Person do
    prefix 'Spaceman'
    family_name 'Bowie'
    given_name 'David'
    suffix 'PhD'
    birth_date '1947'
    death_date '2016'
    birth_place 'Brixton'
    death_place 'Manhattan'
    gender 'Fluid'
    nationality 'Martian'
    alternate_name ['Ziggy Stardust']
    knows ['Mick Ronson']
    affiliation ['NASA']
    member_of ['The Spiders From Mars']
  end

  factory :person_one, class: DogBiscuits::Person do
    name 'Morrissey'
    dates '1959-'
  end

  factory :person_two, class: DogBiscuits::Person do
    preflabel 'Smith, Mark E.'
    given_name 'Stephen Patrick'
  end

  factory :historic_person, class: DogBiscuits::HistoricPerson do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    given_name 'Stephen Patrick'
    family_name 'Morrissey'
    same_as %w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212]
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
    dates '1500-1550'
    epithet 'epithet'
    pre_title 'pre_title'
    post_title 'post_title'
    note ['note']
    dates_of_office '1500-1510'
  end

  factory :group, class: DogBiscuits::Group do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    same_as %w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212]
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
    name 'The Smiths'
    dates '1500-1550'
    qualifier 'order of the phoenix'
    note ['note']
    group_type ['group type']
    foaf_member ['member']
  end

  factory :organisation, class: DogBiscuits::Organisation do
    preflabel 'University of York. Department of Miserabilism'
    name 'The Smiths'
    dates '1500-1550'
    qualifier 'order of the phoenix'
  end

  factory :department, class: DogBiscuits::Organisation do
    preflabel 'Department of Miserabilism'
    name 'Department of Miserabilism'
    dates '1500-1550'
  end

  factory :place, class: DogBiscuits::Place do
    feature_code ['city']
    place_name 'Didsbury'
    parent_ADM4 'Madeup Parish'
    parent_ADM3 'Manchester'
    parent_ADM2 'Greater Manchester'
    parent_ADM1 'England'
    parent_country 'United Kingdom'
    lat 'latitude'
    long 'longitude'
    alt 'altitude'
    parent_feature 'Manchester'
    country_code 'GBR'
    note ['note']
    same_as %w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212]
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
  end
end
