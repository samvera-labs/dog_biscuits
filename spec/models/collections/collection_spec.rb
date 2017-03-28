require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

# TODO: test concerns and validators only once; only test concept specific stuff here

describe DogBiscuits::Collection do
  let(:collection) { FactoryGirl.build(:collection) }
  let(:thesis) { FactoryGirl.build(:thesis) }

  it 'is a collection' do
    expect(collection).to be_collection
  end

  # Concerns
  it_behaves_like 'keyword_subject'
  it_behaves_like 'language'
  it_behaves_like 'common_rights'
  it_behaves_like 'description'
  it_behaves_like 'creator'
  it_behaves_like 'date'

  describe '#related objects' do
    before(:each) do
      collection.members << thesis
    end

    it 'has a member' do
      expect(collection.members.size).to eq(1)
    end
  end
end
