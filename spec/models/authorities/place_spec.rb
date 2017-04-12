require 'spec_helper'

describe DogBiscuits::Place do
  let(:place) { FactoryGirl.create(:place) }

  it_behaves_like 'borthwick_note'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'mads_related_authority'
  it_behaves_like 'owl_same_as'


  it 'is a place' do
    expect(place).to be_place
  end

  # test metadata properties
  describe '#rdftypes' do
    specify { place.type.should include('http://schema.org/Place') }
    specify { place.type.should include('http://purl.org/vra/Place') }
  end

  describe '#metadata' do
    specify { place.feature_code.should eq(['city']) }
    specify { place.place_name.should eq('Didsbury') }
    specify { place.parent_ADM4.should eq('Madeup Parish') }
    specify { place.parent_ADM3.should eq('Manchester') }
    specify { place.parent_ADM2.should eq('Greater Manchester') }
    specify { place.parent_ADM1.should eq('England') }
    specify { place.parent_country.should eq('United Kingdom') }
  end

  it 'gets a preflabel from place elements' do
    place.add_preflabel
    expect(place.preflabel).to eq('Didsbury, Madeup Parish, Manchester, Greater Manchester, England, United Kingdom')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#name') }
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM4') }
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM3') }
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM2') }
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM1') }
    specify { place.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentCountry') }
    specify { place.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/borthwick-registers#featureType') }
  end

end
