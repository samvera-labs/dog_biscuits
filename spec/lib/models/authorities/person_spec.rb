# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Person do
  # Use create instead of build to enable testing of before destroy callback
  let(:stubby) { FactoryBot.create(:person) }
  let(:person_one) { FactoryBot.create(:person_one) }
  let(:person_two) { FactoryBot.create(:person_two) }
  let(:thesis) { FactoryBot.create(:thesis) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'alternate_name'
  it_behaves_like 'person_properties'

  it 'is a person' do
    expect(stubby).to be_person
  end

  describe '#type' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Person') }
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'gets a name from name parts' do
    stubby.add_name
    expect(stubby.name).to eq('Spaceman David Bowie PhD')
  end

  it 'gets dates from date parts' do
    stubby.add_dates
    expect(stubby.dates).to eq('1947-2016')
  end

  it 'gets a rdfs label from name parts' do
    stubby.add_label
    expect(stubby.rdfs_label).to eq('Spaceman David Bowie PhD, 1947-2016')
  end

  it 'gets a preflabel from rdfs label' do
    stubby.add_label
    expect(stubby.preflabel).to eq('Spaceman David Bowie PhD, 1947-2016')
  end

  it 'gets a rdfs label from parts not requiring add_name or add_dates' do
    person_one.add_label
    expect(person_one.rdfs_label).to eq('Morrissey, 1959-')
  end

  it 'gets a rdfs label from incomplete name parts' do
    person_two.add_label
    expect(person_two.rdfs_label).to eq('Stephen Patrick')
  end

  it 'gets a rdfs label from name without a death date' do
    person_two.birth_date = '1959'
    person_two.add_label
    expect(person_two.rdfs_label).to eq('Stephen Patrick, 1959-')
  end

  it 'has rdftypes for PURE' do
    stubby.pure_uuid = 'pure-uuid'
    stubby.add_pure_type
    expect(stubby.type).to include('http://dlib.york.ac.uk/ontologies/pure#Person')
  end

  describe '#update usages for thesis' do
    it 'thesis has creator' do
      thesis.creator_resource << stubby
      stubby.add_label
      expect(thesis.to_solr['creator_label_tesim'].should(include(stubby.preflabel)))
    end
    #
    it 'thesis does not have the creator after person is destroyed' do
      stubby.destroy
      thesis.reload
      expect(thesis.to_solr['creator_label_tesim']).to_not include(stubby.preflabel)
    end
  end
end
