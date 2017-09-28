# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::HistoricPerson do
  let(:stubby) { FactoryGirl.build(:historic_person) }
  let(:scheme) { FactoryGirl.build_stubbed(:concept_scheme) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'hub_dates'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'related_authority'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'skos_note'

  it 'is a historic person' do
    expect(stubby).to be_historic_person
  end

  describe '#rdftypes' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Person') }
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Agent') }
    specify { stubby.type.should include('http://dlib.york.ac.uk/ontologies/borthwick-registers#HistoricPerson') }
  end
  describe '#metadata' do
    specify { stubby.pre_title.should eq('pre_title') }
    specify { stubby.post_title.should eq('post_title') }
    specify { stubby.epithet.should eq('epithet') }
    specify { stubby.dates_of_office.should eq('1500-1510') }
  end

  it 'gets a label from name elements' do
    stubby.add_label
    expect(stubby.rdfs_label).to eq('Morrissey, pre_title, Stephen Patrick, 1500-1550, post_title, epithet')
  end

  it 'gets a preflabel from rdfs_label' do
    stubby.add_label
    expect(stubby.preflabel).to eq('Morrissey, pre_title, Stephen Patrick, 1500-1550, post_title, epithet')
  end

  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(stubby.concept_scheme).to be_a(DogBiscuits::ConceptScheme)
    end
  end

  describe '#predicates' do
    specify { rdf.should include('http://data.archiveshub.ac.uk/def/epithet') }
    specify { rdf.should include('http://data.archiveshub.ac.uk/def/title') }
    specify { rdf.should include('http://dlib.york.ac.uk/ontologies/generic#datesOfOffice') }
    specify { rdf.should include('http://dlib.york.ac.uk/ontologies/generic#preTitle') }
  end
end
