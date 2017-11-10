# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Organisation do
  let(:stubby) { FactoryBot.build(:organisation) }
  let(:concept_scheme) { FactoryBot.build(:concept_scheme) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'foaf_name'

  it 'is an organisation' do
    expect(stubby).to be_organisation
  end

  it 'is a member of a concept scheme' do
    concept_scheme.organisations << stubby
    expect(concept_scheme.organisations).to include(stubby)
  end

  describe '#metadata' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Organization') }
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  it 'gets a rdfs label from name parts' do
    stubby.add_label
    expect(stubby.rdfs_label).to eq('The Smiths, 1500-1550, order of the phoenix')
  end

  it 'gets a preflabel from rdfs label' do
    stubby.add_label
    expect(stubby.preflabel).to eq('The Smiths, 1500-1550, order of the phoenix')
  end

  describe '#predicates' do
    specify { rdf.should include('http://xmlns.com/foaf/0.1/name') }
  end

  it 'has rdftypes for PURE' do
    stubby.pure_uuid = 'pure-uuid'
    stubby.add_pure_type
    expect(stubby.type).to include('http://dlib.york.ac.uk/ontologies/pure#Organisation')
  end
end
