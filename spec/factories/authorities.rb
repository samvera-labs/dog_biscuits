FactoryGirl.define do
  factory :concept_scheme, class: DogBiscuits::ConceptScheme do
    preflabel 'label'
    altlabel  ['alternative label']
    description ['description']
  end

  factory :subjects, class: DogBiscuits::ConceptScheme do
    preflabel 'subjects'
  end

  factory :departments, class: DogBiscuits::ConceptScheme do
    preflabel 'departments'
  end

  factory :organisations, class: DogBiscuits::ConceptScheme do
    preflabel 'organisations'
  end

  factory :projects, class: DogBiscuits::ConceptScheme do
    preflabel 'projects'
  end

  factory :people, class: DogBiscuits::ConceptScheme do
    preflabel 'people'
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

  factory :concept, class: DogBiscuits::Concept do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    definition 'my definition is this'
    skos_note 'notes'
    approved 'true'
    rules 'nca'
    used 'true'
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)

    # after(:build, &:map_labels)
    #
    # trait :with_before_save_callback do
    #   after(:build, &:map_labels)
    # end
  end

  factory :group, class: DogBiscuits::Group do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
    name 'name'
    dates '1500-1550'
    qualifier 'order of the phoenix'
    note ['note']
    group_type ['group type']
  end

  factory :historic_person, class: DogBiscuits::HistoricPerson do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    given_name 'Stephen Patrick'
    family_name 'Morrissey'
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)
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

  factory :organisation, class: DogBiscuits::Organisation do
    preflabel 'University of York. Department of Miserabilism'
    name 'name'
  end

  factory :person, class: DogBiscuits::Person do
    preflabel 'Smith, Mark E.'
    family_name 'Morrissey'
    given_name 'Stephen Patrick'
  end

  factory :simple_concept, class: DogBiscuits::Concept do
    preflabel 'miserabilism'
  end

  factory :project, class: DogBiscuits::Project do
    preflabel 'A scientific study into misery'
    name 'A scientific study into misery'
    identifier ['identifier_test']
    funder ['funder']
  end
end
