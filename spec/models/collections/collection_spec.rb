# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Collection do
  let(:collection) { FactoryGirl.build(:collection) }
  let(:thesis) { FactoryGirl.build(:thesis) }

  it 'is a collection' do
    expect(collection).to be_collection
  end

  describe '#related objects' do
    before do
      collection.members << thesis
    end

    it 'has member' do
      expect(collection.members.size).to eq(1)
    end
  end
end
