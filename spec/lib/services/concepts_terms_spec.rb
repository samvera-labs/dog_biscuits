# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Terms::ConceptsTerms do
  let(:terms) { described_class.new }

  it 'has no terms' do
    terms.all.should eq([])
  end

  let(:concept) { FactoryBot.create(:concept) }
  let(:concepts) { FactoryBot.create(:concepts) }

  it 'has one term' do
    concepts.concepts << concept
    terms.all.length.should eq(1)
  end

  it 'has term hash' do
    concepts.concepts << concept
    terms.all.should eq([{ id: concept.id.to_s, label: "label", definition: "my definition is this" }])
  end

  it 'does not find the term by id' do
    concepts.concepts << concept
    terms.find('not-a-real-id').should eq([])
  end

  # intermittently fails
  skip 'finds the term by id' do
    concepts.concepts << concept
    terms.find(concept.id).first[:label].should eq('label')
  end

  it 'returns one result' do
    concepts.concepts << concept
    terms.search('label').length.should eq(1)
  end

  it 'returns no results' do
    concepts.concepts << concept
    terms.search('fake search').length.should eq(0)
  end

  it 'finds the id by the label' do
    concepts.concepts << concept
    terms.find_id('label').should match(/[[:alnum:]]{9,}/)
  end

  it 'finds the label by the id' do
    concepts.concepts << concept
    terms.find_label_string(concept.id).should eq(['label'])
  end

  it 'returns all for options list' do
    concepts.concepts << concept
    terms.select_all_options.should match([["label", /[[:alnum:]]{9,}/]])
  end
end
