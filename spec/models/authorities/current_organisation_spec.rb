require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::CurrentOrganisation do
  let(:current_org) { FactoryGirl.build(:current_organisation) }
  let(:concept_scheme) { FactoryGirl.build(:concept_scheme) }

  it_behaves_like 'foaf_name'

  it 'is a current organisation' do
    expect(current_org).to be_current_organisation
  end

  it 'is a member of a concept scheme' do
    concept_scheme.current_organisations << current_org
    expect(concept_scheme.current_organisations).to include(current_org)
  end

  # test metadata properties
  describe '#metadata' do
    specify { current_org.type.should include('http://xmlns.com/foaf/0.1/Organization') }
    specify { current_org.type.should include('https://schema.org/Organization') }
    specify { current_org.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { current_org.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/name') }
  end
end
