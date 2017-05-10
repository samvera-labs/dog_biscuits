# frozen_string_literal: true

FactoryGirl.define do
  factory :generic_work, class: ActiveFedora::Base do
    title ['Generic Work']
  end

  factory :conference_item, class: DogBiscuits::ConferenceItem do
    title ['Published Item']
    pagination 'pagination_test'
    date_accepted '2014'
    date_submitted '2013'
    date_published '2016'
    date_available '2015'
    isbn ['xxx-xxx-xxx']
    refereed true
    official_url ['http://www.london.ac.uk']
    publication_status 'Published'
    place_of_publication ['Salford']
    editor ['Stephen Street']
    origin_date '2012'
    proceeding ['Proceedings of the Conference of Misery']
  end

  factory :book, class: DogBiscuits::Book do
    title ['Published Item']
    issue_number 'issue_number_test'
    volume_number 'volume_number_test'
    pagination 'pagination_test'
    date_accepted '2014'
    date_submitted '2013'
    date_published '2016'
    date_available '2015'
    isbn ['xxx-xxx-xxx']
    refereed true
    official_url ['http://www.london.ac.uk']
    publication_status 'Published'
    edition ['First Edition']
    part ['Part One']
    series ['The Woeful Series']
    place_of_publication ['Salford']
    editor ['Stephen Street']
  end

  factory :published_work, class: DogBiscuits::PublishedWork do
    title ['Published Item']
    issue_number 'issue_number_test'
    volume_number 'volume_number_test'
    pagination 'pagination_test'
    date_accepted '2014'
    date_submitted '2013'
    date_published '2016'
    date_available '2015'
    isbn ['xxx-xxx-xxx']
    refereed true
    official_url ['http://www.london.ac.uk']
    publication_status 'Published'
    edition ['First Edition']
    part ['Part One']
    series ['The Woeful Series']
    place_of_publication ['Salford']
    editor ['Stephen Street']
  end

  factory :dataset, class: DogBiscuits::Dataset do
    title ['Strangeways, Here We Come']
    embargo_release 2016 - 12 - 12
    dc_access_rights ['access rights']
    doi ['xxx-xxx-xxx']
    has_restriction ['10 years from last access']
    for_indexing ['lovely stuff for indexing']
    publisher ['Rough Trade Records']
    date_available '2015'
    pure_uuid 'xxxx-xxxx-xxxx-xxxx'
    pure_creation '2002-05-30T09:00:00'
    pure_type ['pure type']
    pure_link ['pure link']
    creator ['Marr, Johnny']
    last_access '2016-01-01'
    number_of_downloads '52'
    resource_type ['Software']
  end

  factory :exam_paper, class: DogBiscuits::ExamPaper do
    creator ['Marr, Johnny']
    date ['2016-01-01']
    description ['description']
    qualification_level ['PhD']
    qualification_name ['qualification']
    language ['English']
    language_code ['en-GB']
    rights_holder ['Johnny Marr']
    license ['https://creativecommons.org/publicdomain/mark/1.0/']
    rights_statement ['http://rightsstatements.org/vocab/InC/1.0/']
    rights_description ['some additoinal stuff about rights']
    former_id ['york:1234']
    module_code ['XXXXXX']
    collections_category ['self-renewing']
    contributor ['Joyce, Mike']
  end

  factory :package, class: DogBiscuits::Package do
    title ['title']
    transfer_uuid 'transfer-uuid'
    sip_uuid 'sip-uuid'
    aip_uuid 'aip-uuid'
    dip_uuid 'dip-uuid'
    aip_status 'aip-status'
    dip_status 'dip-status'
    aip_size 'aip-size'
    dip_size 'dip-size'
    aip_current_path 'aip-current-path'
    dip_current_path 'dip-current-path'
    aip_current_location 'aip-current-location'
    dip_current_location 'dip-current-location'
    aip_resource_uri 'aip-uri'
    dip_resource_uri 'dip-uri'
    origin_pipeline 'origin-pipeline'

    # after(:build, &:add_types)
    #
    # trait :with_before_save_callback do
    #   after(:build, &:add_types)
    # end
  end

  factory :thesis, class: DogBiscuits::Thesis do
    title ['The Importance of Being Unhappy']
    abstract ['abstract']
    creator ['Marr, Johnny']
    advisor ['Rourke, Andy']
    date_of_award '2016-01-01'
    qualification_level ['PhD']
    qualification_name ['qualification']
    language ['English']
    language_code ['en-GB']
    keyword ['northern misery']
    subject ['Official Heading for Woe']
    rights_holder ['Johnny Marr']
    license ['https://creativecommons.org/publicdomain/mark/1.0/']
    rights_statement ['http://rightsstatements.org/vocab/InC/1.0/']
    rights_description ['some additoinal stuff about rights']
    former_id ['york:1234']
    doi ['xxx-xxx-xxx']
  end

  factory :journal_article, class: DogBiscuits::JournalArticle do
    title ['Journal Article test']
    creator ['Digital York']
    rights_holder ['Johnny Marr']
    license ['https://creativecommons.org/publicdomain/mark/1.0/']
    rights_statement ['http://rightsstatements.org/vocab/InC/1.0/']
    rights_description ['some additoinal stuff about rights']
    issue_number 'issue_number_test'
    volume_number 'volume_number_test'
    pagination 'pagination_test'
    identifier ['identifier_test']
    related_url ['http://www.ulcc.ac.uk']
    date_accepted '2014'
    date_submitted '2013'
    date_published '2016'
    date_available '2015'
    refereed true
    official_url ['http://www.london.ac.uk']
    publication_status 'Published'
    journal ['The Journal of Woe']
  end
end
