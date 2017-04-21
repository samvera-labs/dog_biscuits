# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Terms::GroupsTerms do
  let(:terms) { described_class.new('groups') }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:group) { FactoryGirl.create(:group) }
  let(:groups) { FactoryGirl.create(:groups) }

  it 'has one term' do
    groups.groups << group
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    groups.groups << group
    terms.all.should eq([{ id: group.id.to_s, label: "The Smiths, 1500-1550, order of the phoenix" }])
  end

  it 'does not find the term by id' do
    groups.groups << group
    terms.find('not-a-real-id').should eq([])
  end

  it 'finds the term by id' do
    groups.groups << group
    terms.find(group.id).first[:label].should eq('The Smiths, 1500-1550, order of the phoenix')
  end

  it 'returns one result' do
    groups.groups << group
    terms.search('phoenix').length.should eq(1)
  end

  it 'returns no results' do
    groups.groups << group
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    groups.groups << group
    terms.find_id('The Smiths, 1500-1550, order of the phoenix').should match(/[[:alnum:]]{9,}/)
  end

  it 'finds the label by the id' do
    groups.groups << group
    terms.find_value_string(group.id).should eq(['The Smiths, 1500-1550, order of the phoenix'])
  end

  it 'returns all for options list' do
    groups.groups << group
    terms.select_all_options.should match([["The Smiths, 1500-1550, order of the phoenix", /[[:alnum:]]{9,}/]])
  end
end
