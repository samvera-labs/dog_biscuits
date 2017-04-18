# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Terms::DepartmentsTerms do
  let(:terms) { described_class.new('departments') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:organisation) { FactoryGirl.create(:organisation) }
  let(:departments) { FactoryGirl.create(:departments) }

  it 'has one term' do
    departments.departments << organisation
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    departments.departments << organisation
    terms.all.should eq([{ id: organisation.id.to_s, label: "name, 1500-1550, order of the phoenix" }])
  end

  it 'does not find the term by id' do
    departments.departments << organisation
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    departments.departments << organisation
    terms.find(organisation.id).first[:label].should eq('name, 1500-1550, order of the phoenix')
  end

  it 'returns one result' do
    departments.departments << organisation
    terms.search('phoenix').length.should eq(1)
  end

  it 'returns no results' do
    departments.departments << organisation
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    departments.departments << organisation
    terms.find_id('name, 1500-1550, order of the phoenix').should eq(organisation.id)
  end

  it 'finds the label by the id' do
    departments.departments << organisation
    terms.find_value_string(organisation.id).should eq(['name, 1500-1550, order of the phoenix'])
  end

  it 'returns all for options list' do
    departments.departments << organisation
    terms.select_all_options.should eq([["name, 1500-1550, order of the phoenix", organisation.id.to_s]])
  end
end
