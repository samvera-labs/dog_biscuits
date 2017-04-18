# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::HistoricPerson do
  let(:historic_person) { FactoryGirl.build(:historic_person) }
  let(:scheme) { FactoryGirl.build_stubbed(:concept_scheme) }

  it_behaves_like 'borthwick_note'
  it_behaves_like 'foaf_name_parts'
  it_behaves_like 'hub_dates'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'mads_related_authority'
  it_behaves_like 'owl_same_as'

  it 'is a person' do
    expect(historic_person).to be_historic_person
  end

  describe '#metadata' do
    specify { historic_person.type.should include('http://schema.org/Person') }
    specify { historic_person.type.should include('http://xmlns.com/foaf/0.1/Agent') }
    specify { historic_person.type.should include('http://vocab.getty.edu/ontology#PersonConcept') }
    specify { historic_person.pre_title.should eq('pre_title') }
    specify { historic_person.post_title.should eq('post_title') }
    specify { historic_person.epithet.should eq('epithet') }
    specify { historic_person.dates_of_office.should eq('1500-1510') }
  end

  it 'gets a preflabel from name elements' do
    historic_person.add_preflabel
    expect(historic_person.preflabel).to eq('Morrissey, pre_title, Stephen Patrick, 1500-1550, post_title, epithet')
  end

  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(historic_person.concept_scheme).to be_a(DogBiscuits::ConceptScheme)
    end
  end

  describe '#predicates' do
    specify { historic_person.resource.dump(:ttl).should include('http://data.archiveshub.ac.uk/def/epithet') }
    specify { historic_person.resource.dump(:ttl).should include('http://data.archiveshub.ac.uk/def/title') }
    specify { historic_person.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#datesOfOffice') }
    specify { historic_person.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#preTitle') }
  end
end
