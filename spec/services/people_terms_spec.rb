require 'spec_helper'

describe DogBiscuits::Terms::PeopleTerms do

  let(:terms) { described_class.new('people') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:person) { FactoryGirl.create(:person) }
  let(:people) { FactoryGirl.create(:people) }

  it 'has one term' do
    people.people << person
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    people.people << person
    terms.all.should eq([{:id=>"#{person.id}", :label=>"Morrissey, Stephen Patrick", :definition=>nil}])
  end

  it 'does not find the term by id' do
    people.people << person
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    people.people << person
    terms.find(person.id).first[:label].should eq('Morrissey, Stephen Patrick')
  end

  it 'returns one result' do
    people.people << person
    terms.search('Morrissey').length.should eq(1)
  end

  it 'returns no results' do
    people.people << person
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    people.people << person
    terms.find_id('Morrissey, Stephen Patrick').should eq(person.id)
  end

  it 'finds the label by the id' do
    people.people << person
    terms.find_value_string(person.id).should eq(['Morrissey, Stephen Patrick'])
  end

  it 'returns all for options list' do
    people.people << person
    terms.select_all_options.should eq([["Morrissey, Stephen Patrick", "#{person.id}"]])
  end

end