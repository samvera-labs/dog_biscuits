# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Organisation do
  let(:org) { FactoryGirl.build(:organisation) }
  let(:concept_scheme) { FactoryGirl.build(:concept_scheme) }

  it_behaves_like 'foaf_name'

  it 'is a current organisation' do
    expect(org).to be_organisation
  end

  it 'is a member of a concept scheme' do
    concept_scheme.organisations << org
    expect(concept_scheme.organisations).to include(org)
  end

  describe '#metadata' do
    specify { org.type.should include('http://xmlns.com/foaf/0.1/Organization') }
    specify { org.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'gets a rdfs label from name parts' do
    org.add_label
    expect(org.rdfs_label).to eq('name, 1500-1550, order of the phoenix')
  end

  it 'gets a preflabel from rdfs label' do
    org.add_label
    expect(org.preflabel).to eq('name, 1500-1550, order of the phoenix')
  end

  describe '#predicates' do
    specify { org.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/name') }
  end

  it 'has rdftypes for PURE' do
    org.pure_uuid = 'pure-uuid'
    org.add_pure_type
    expect(org.type).to include('http://dlib.york.ac.uk/ontologies/pure#Organisation')
  end
end
