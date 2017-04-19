# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Agent do
  let(:agent) { FactoryGirl.create(:agent) } # described class?

  it_behaves_like 'foaf_name'
  it_behaves_like 'rdfs_label'
  it_behaves_like 'schema_alternate_name'
  it_behaves_like 'identified_by'

  it 'is an agent' do
    expect(agent).to be_agent
  end

  describe '#metadata' do
    specify { agent.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'has email' do
    expect(agent.email).to eq(['factory@hacienda.com'])
  end
  it 'has homepage' do
    expect(agent.homepage).to eq(['factory.com'])
  end
  it 'has account' do
    expect(agent.account).to eq(['online_account'])
  end
  it 'has email predicate' do
    expect(agent.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/mbox')))
  end
  it 'has homepage predicate' do
    expect(agent.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/homepage')))
  end
  it 'has account predicate' do
    expect(agent.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/account')))
  end

  it 'gets rdfs label from name' do
    agent.add_label
    expect(agent.rdfs_label).to eq('The Smiths')
  end
  it 'gets preflabel from rdfs label' do
    agent.add_label
    expect(agent.preflabel).to eq('The Smiths')
  end
end
