require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::Person do
  
  let(:person) { FactoryGirl.build(:person) }
  
  it_behaves_like 'foaf_name_parts'
    
  it 'is a person' do
    expect(person).to be_person
  end

  # test metadata properties
  describe '#metadata' do
    specify { person.type.should include('http://xmlns.com/foaf/0.1/Person') }
    specify { person.type.should include('http://schema.org/Person') }
    specify { person.type.should include('http://xmlns.com/foaf/0.1/Agent') }
  end
  
  # failing
  it 'gets a preflabel from given and family name' do
    person.add_preflabel
    expect(person.preflabel).to eq('Morrissey, Stephen Patrick')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { person.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/givenName') }
    specify { person.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/familyName') }
  end
end
