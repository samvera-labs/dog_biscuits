# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Organisation do
  let(:current_org) { FactoryGirl.build(:organisation) }
  let(:concept_scheme) { FactoryGirl.build(:concept_scheme) }

  it_behaves_like 'foaf_name'

  it 'is a current organisation' do
    expect(current_org).to be_organisation
  end

  it 'is a member of a concept scheme' do
    concept_scheme.organisations << current_org
    expect(concept_scheme.organisations).to include(current_org)
  end

  describe '#metadata' do
    specify { current_org.type.should include('http://xmlns.com/foaf/0.1/Organization') }
    specify { current_org.type.should include('https://schema.org/Organization') }
    specify { current_org.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'gets a preflabel from name parts' do
    current_org.add_preflabel
    expect(current_org.preflabel).to eq('name, 1500-1550, order of the phoenix')
  end

  describe '#predicates' do
    specify { current_org.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/name') }
  end

  it 'has rdftypes for PURE' do
    current_org.pure_uuid = 'pure-uui'
    current_org.add_pure_type
    expect(current_org.type).to include('http://dlib.york.ac.uk/ontologies/pure#Organisation')
  end
end
