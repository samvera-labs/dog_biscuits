# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Person do
  # Use create instead of build to enable testing of before destroy callback

  let(:person) { FactoryGirl.create(:person) }
  let(:person_one) { FactoryGirl.create(:person_one) }
  let(:person_two) { FactoryGirl.create(:person_two) }
  let(:thesis) { FactoryGirl.create(:thesis) }

  it_behaves_like 'schema_alternate_name'
  it_behaves_like 'add_person_properties'

  it 'is a person' do
    expect(person).to be_person
  end

  describe '#metadata' do
    specify { person.type.should include('http://xmlns.com/foaf/0.1/Person') }
    specify { person.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'gets a name from name parts' do
    person.add_name
    expect(person.name).to eq('Spaceman David Bowie PhD')
  end

  it 'gets dates from date parts' do
    person.add_dates
    expect(person.dates).to eq('1947-2016')
  end

  it 'gets a rdfs label from name parts' do
    person.add_label
    expect(person.rdfs_label).to eq('Spaceman David Bowie PhD, 1947-2016')
  end

  it 'gets a preflabel from rdfs label' do
    person.add_label
    expect(person.preflabel).to eq('Spaceman David Bowie PhD, 1947-2016')
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

  describe '#update usages for thesis' do
    it 'thesis has creator' do
      thesis.creator_resource << person
      expect(thesis.to_solr.should(include('creator_value_tesim')))
    end
    #
    it 'thesis does not have the creator after person is destroyed' do
      person.destroy
      thesis.reload
      expect(thesis.to_solr['creator_value_tesim']).to eq([])
    end
  end
end
