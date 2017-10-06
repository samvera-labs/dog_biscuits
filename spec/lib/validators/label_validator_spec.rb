# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::LabelValidator do
  let(:authority) { DogBiscuits::Concept.new }
  let(:collection) { DogBiscuits::Collection.new }
  let(:work) { Dataset.new }
  let(:person) { DogBiscuits::Person.new }
  let(:organisation) { DogBiscuits::Organisation.new }

  it 'work does not save without a title' do
    expect(work.save).to be_falsey
  end

  it 'collection does not save without a title' do
    expect(collection.save).to be_falsey
  end

  it 'authority does not save without a label' do
    expect(authority.save).to be_falsey
  end

  it 'person does not save without a label or name part' do
    expect(person.save).to be_falsey
  end

  it 'organisation does not same without a label or name' do
    expect(organisation.save).to be_falsey
  end
end
