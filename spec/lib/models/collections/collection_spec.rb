# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Collection do
  let(:stubby) { FactoryBot.build(:collection) }
  let(:thesis) { FactoryBot.build(:thesis) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'is a collection' do
    expect(stubby).to be_collection
  end

  describe '#related objects' do
    before do
      stubby.members << thesis
    end

    it 'has member' do
      expect(stubby.members.size).to eq(1)
    end
  end
end
