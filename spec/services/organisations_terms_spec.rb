require 'spec_helper'

describe DogBiscuits::Terms::OrganisationsTerms do

  let(:terms) { described_class.new('organisations') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:organisation) { FactoryGirl.create(:organisation) }
  let(:organisations) { FactoryGirl.create(:organisations) }

  it 'has one term' do
    organisations.organisations << organisation
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    organisations.organisations << organisation
    terms.all.should eq([{:id=>"#{organisation.id}", :label=>"University of York. Department of Miserabilism", :definition=>nil}])
  end

  it 'does not find the term by id' do
    organisations.organisations << organisation
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    organisations.organisations << organisation
    terms.find(organisation.id).first[:label].should eq('University of York. Department of Miserabilism')
  end

  it 'returns one result' do
    organisations.organisations << organisation
    terms.search('Department of Miserabilism').length.should eq(1)
  end

  it 'returns no results' do
    organisations.organisations << organisation
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    organisations.organisations << organisation
    terms.find_id('University of York. Department of Miserabilism').should eq(organisation.id)
  end

  it 'finds the label by the id' do
    organisations.organisations << organisation
    terms.find_value_string(organisation.id).should eq(['University of York. Department of Miserabilism'])
  end

  it 'returns all for options list' do
    organisations.organisations << organisation
    terms.select_all_options.should eq([["University of York. Department of Miserabilism", "#{organisation.id}"]])
  end

end