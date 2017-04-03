require 'spec_helper'

describe DogBiscuits::Person do

  # Use create instead of build to enable testing of before destroy callback
  
  let(:person) { FactoryGirl.create(:person) }
  let(:thesis) {FactoryGirl.create(:thesis) }
  
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

  describe '#update usages for thesis' do

    it 'thesis has creator' do
      thesis.creator_resource << person
      expect(thesis.to_solr.should include('creator_value_tesim'))
    end
#
    it 'thesis does not have the creator after person is destroyed' do
      person.destroy
      thesis.reload
      expect(thesis.to_solr['creator_value_tesim']).to eq([])
    end

  end

end
