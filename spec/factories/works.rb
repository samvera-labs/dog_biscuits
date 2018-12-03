# frozen_string_literal: true

FactoryBot.define do
  factory :generic_work, class: ActiveFedora::Base do
    title { ['Generic Work'] }
  end

  factory :conference_item, class: ConferenceItem do
    title { ['Conference Item'] }
    pagination { ['pagination_test'] }
    date_accepted { ['2014'] }
    date_submitted { ['2013'] }
    date_published { ['2016'] }
    date_available { ['2015'] }
    event_date { ['2012'] }
    isbn { ['xxx-xxx-xxx'] }
    location { ['The Hacienda, Manchester'] }
    refereed { [true] }
    publication_status { ['Published'] }
    place_of_publication { ['Salford'] }
    editor { ['Street, Stephen'] }
    part_of { ['Proceedings of the Conference of Misery'] }
    presented_at { ['The International Conference of Misery'] }
  end

  factory :published_work, class: PublishedWork do
    title { ['Published Item'] }
    issue_number { ['issue_number_test'] }
    volume_number { ['volume_number_test'] }
    pagination { ['pagination_test'] }
    date_accepted { ['2014'] }
    date_submitted { ['2013'] }
    date_published { ['2016'] }
    date_available { ['2015'] }
    isbn { ['xxx-xxx-xxx'] }
    refereed { [true] }
    official_url { ['http://www.london.ac.uk'] }
    publication_status { ['Published'] }
    publisher { ['Rough Trade Records'] }
    edition { ['First Edition'] }
    part { ['Part One'] }
    series { ['The Woeful Series'] }
    place_of_publication { ['Salford'] }
    editor { ['Street, Stephen'] }
  end

  factory :digital_archival_object, class: DigitalArchivalObject do
    title { ['Digital Archival Object'] }
    access_provided_by { ['Rough Trade Records Archive'] }
    extent { ['500 files'] }
    part_of { ['Accession 51'] }
    lat { ['latitude'] }
    long { ['longitude'] }
    alt { ['altitude'] }
  end

  factory :dataset, class: Dataset do
    title { ['Strangeways, Here We Come'] }
    creator { ['Marr, Johnny'] }
    dc_access_rights { ['access rights'] }
    doi { ['xxx-xxx-xxx'] }
    has_restriction { ['10 years from last access'] }
    for_indexing { ['lovely stuff for indexing'] }
    date_available { ['2015'] }
    # pure_uuid {'xxxx-xxxx-xxxx-xxxx'}
    # pure_creation {'2002-05-30T09:00:00'}
    # pure_type {['pure type']}
    # pure_link {['pure link']}
    last_access { '2016-01-01' }
    number_of_downloads { '52' }
    output_of { ['some project'] }
    resource_type { ['Software'] }
    requestor_email { ['me@example.com'] }
    date_collected { ['2012'] }
    date_copyrighted { ['2017'] }
    date_issued { ['2017'] }
    date_updated { ['2018'] }
    date_valid { ['2017-2020'] }
    dc_format { ['vinyl'] }
    resource_type_general { ['Sound'] }
    subtitle { ['Work is a four-letter word'] }
  end

  factory :exam_paper, class: ExamPaper do
    creator { ['Marr, Johnny'] }
    date_available { ['2016-01-01'] }
    qualification_level { ['PhD'] }
    qualification_name { ['qualification'] }
    module_code { ['XXXXXX'] }
  end

  factory :package, class: Package do
    title { ['title'] }
    transfer_uuid { ['transfer-uuid'] }
    sip_uuid { ['sip-uuid'] }
    aip_uuid { ['aip-uuid'] }
    dip_uuid { ['dip-uuid'] }
    aip_status { ['aip-status'] }
    dip_status { ['dip-status'] }
    aip_size { ['aip-size'] }
    dip_size { ['dip-size'] }
    aip_current_path { ['aip-current-path'] }
    dip_current_path { ['dip-current-path'] }
    aip_current_location { ['aip-current-location'] }
    dip_current_location { ['dip-current-location'] }
    aip_resource_uri { ['aip-uri'] }
    dip_resource_uri { ['dip-uri'] }
    origin_pipeline { ['origin-pipeline'] }
  end

  # validate all common metadata here
  factory :thesis, class: Thesis do
    title { ['The Importance of Being Unhappy'] }
    abstract { ['abstract'] }
    advisor { ['Rourke, Andy'] }
    bibliographic_citation { ['NME, 6(2), 1984'] }
    creator { ['Marr, Johnny'] }
    contributor { ['Joyce, Mike'] }
    date_created { ['2015-01-01'] }
    date_of_award { ['2016-01-01'] }
    department { ['Departmtent of Worry and Woe'] }
    description { ['description'] }
    doi { ['xxx-xxx-xxx'] }
    former_identifier { ['york:1234'] }
    keyword { ['northern misery'] }
    language { ['English'] }
    language_code { ['en-GB'] }
    qualification_level { ['PhD'] }
    qualification_name { ['qualification'] }
    related_url { ['http://www.ulcc.ac.uk'] }
    rights_holder { ['Johnny Marr'] }
    license { ['https://creativecommons.org/publicdomain/mark/1.0/'] }
    rights_statement { ['http://rightsstatements.org/vocab/InC/1.0/'] }
    rights_description { ['some additional stuff about rights'] }
    source { ['tomato'] }
    subject { ['Official Heading for Woe'] }
    awarding_institution { ['Awarding Institution'] }
  end

  factory :journal_article, class: JournalArticle do
    title { ['Journal Article test'] }
    creator { ['Digital York'] }
    issue_number { ['issue_number_test'] }
    volume_number { ['volume_number_test'] }
    pagination { ['pagination_test'] }
    identifier { ['identifier_test'] }
    date_accepted { ['2014'] }
    date_submitted { ['2013'] }
    date_published { ['2016'] }
    date_available { ['2015'] }
    refereed { [true] }
    official_url { ['http://www.london.ac.uk'] }
    output_of { ['some project'] }
    publication_status { ['Published'] }
    part_of { ['The Journal of Woe'] }
    managing_organisation { ['Managing Organisation'] }
  end
end
