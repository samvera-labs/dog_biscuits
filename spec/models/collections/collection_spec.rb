require 'spec_helper'

describe DogBiscuits::Collection do
  let(:collection) { FactoryGirl.build(:collection) }
  let(:thesis) { FactoryGirl.build(:thesis) }

  it 'is a collection' do
    expect(collection).to be_collection
  end

  it_behaves_like 'keyword_subject'
  it_behaves_like 'language'
  it_behaves_like 'common_rights'
  it_behaves_like 'description'
  it_behaves_like 'creator'
  it_behaves_like 'date'

  describe '#related objects' do
    before do
      collection.members << thesis
    end

    it 'has member' do
      expect(collection.members.size).to eq(1)
    end
  end
end
