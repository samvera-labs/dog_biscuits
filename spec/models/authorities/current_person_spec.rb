require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::CurrentPerson do
  
  let(:current_person) { FactoryGirl.build(:current_person) }
  
  it_behaves_like 'foaf_name_parts'
    
  it 'is a person' do
    expect(current_person).to be_current_person
  end

  # test metadata properties
  describe '#metadata' do
    specify { current_person.type.should include('http://xmlns.com/foaf/0.1/Person') }
    specify { current_person.type.should include('http://schema.org/Person') }
    specify { current_person.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end
  
  # failing
  it 'gets a preflabel from given and family name' do
    current_person.add_preflabel
    expect(current_person.preflabel).to eq('Morrissey, Stephen Patrick')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { current_person.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/givenName') }
    specify { current_person.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/familyName') }
  end
end
