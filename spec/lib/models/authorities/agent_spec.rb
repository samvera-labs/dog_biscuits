# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Agent do
  let(:stubby) { FactoryGirl.create(:agent) } # described class?
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'foaf_name'
  it_behaves_like 'alternate_name'
  it_behaves_like 'identified_by'

  it 'is an agent' do
    expect(stubby).to be_agent
  end

  describe '#metadata' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'has email' do
    expect(stubby.email).to eq(['factory@hacienda.com'])
  end
  it 'has homepage' do
    expect(stubby.homepage).to eq(['factory.com'])
  end
  it 'has account' do
    expect(stubby.account).to eq(['online_account'])
  end
  it 'has email predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/mbox')))
  end
  it 'has homepage predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/homepage')))
  end
  it 'has account predicate' do
    expect(rdf.should(include('http://xmlns.com/foaf/0.1/account')))
  end

  it 'gets rdfs label from name' do
    stubby.add_label
    expect(stubby.rdfs_label).to eq('The Smiths')
  end
  it 'gets preflabel from rdfs label' do
    stubby.add_label
    expect(stubby.preflabel).to eq('The Smiths')
  end
end
