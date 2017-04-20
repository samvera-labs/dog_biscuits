# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Terms::DepartmentsTerms do
  let(:terms) { described_class.new('departments') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:department) { FactoryGirl.create(:department) }
  let(:departments) { FactoryGirl.create(:departments) }

  it 'has one term' do
    departments.departments << department
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    departments.departments << department
    terms.all.should eq([{ id: department.id.to_s, label: "Department of Miserabilism, 1500-1550" }])
  end

  it 'does not find the term by id' do
    departments.departments << department
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    departments.departments << department
    terms.find(department.id).first[:label].should eq('Department of Miserabilism, 1500-1550')
  end

  it 'returns one result' do
    departments.departments << department
    terms.search('Miserabilism').length.should eq(1)
  end

  it 'returns no results' do
    departments.departments << department
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    departments.departments << department
    terms.find_id('Department of Miserabilism, 1500-1550').should eq(department.id)
  end

  it 'finds the label by the id' do
    departments.departments << department
    terms.find_value_string(department.id).should eq(['Department of Miserabilism, 1500-1550'])
  end

  it 'returns all for options list' do
    departments.departments << department
    terms.select_all_options.should eq([["Department of Miserabilism, 1500-1550", department.id.to_s]])
  end
end
