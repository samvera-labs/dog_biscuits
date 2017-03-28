require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::Person do
  let(:person) { FactoryGirl.build(:person) }
  let(:scheme) { FactoryGirl.build_stubbed(:concept_scheme) }

  it_behaves_like 'borthwick_note'
  it_behaves_like 'foaf_name_parts'
  it_behaves_like 'hub_dates'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'mads_related_authority'
  it_behaves_like 'owl_same_as'

  it 'is a person' do
    expect(person).to be_person
  end

  # test metadata properties
  describe '#metadata' do
    specify { person.type.should include('http://schema.org/Person') }
    specify { person.type.should include('http://xmlns.com/foaf/0.1/Agent') }
    specify { person.type.should include('http://vocab.getty.edu/ontology#PersonConcept') }
    specify { person.pre_title.should eq('pre_title') }
    specify { person.post_title.should eq('post_title') }
    specify { person.epithet.should eq('epithet') }
    specify { person.dates_of_office.should eq('1500-1510') }
  end

  # test related objects
  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(person.concept_scheme).to be_a(DogBiscuits::ConceptScheme)
    end
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { person.resource.dump(:ttl).should include('http://data.archiveshub.ac.uk/def/epithet') }
    specify { person.resource.dump(:ttl).should include('http://data.archiveshub.ac.uk/def/title') }
    specify { person.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#datesOfOffice') }
    specify { person.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#preTitle') }
  end
end
