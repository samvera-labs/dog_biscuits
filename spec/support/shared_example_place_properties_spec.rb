# frozen_string_literal: true

shared_examples_for 'place_properties' do
  describe '#place metadata' do
    specify { stubby.feature_code.should eq(['city']) }
    specify { stubby.place_name.should eq('Didsbury') }
    specify { stubby.parent_ADM4.should eq('Madeup Parish') }
    specify { stubby.parent_ADM3.should eq('Manchester') }
    specify { stubby.parent_ADM2.should eq('Greater Manchester') }
    specify { stubby.parent_ADM1.should eq('England') }
    specify { stubby.parent_country.should eq('United Kingdom') }
    specify { stubby.parent_feature.should eq('Manchester') }
  end

  describe '#place predicates' do
    specify { rdf.should include('http://www.geonames.org/ontology#name') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentADM4') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentADM3') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentADM2') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentADM1') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentCountry') }
    specify { rdf.should include('http://www.geonames.org/ontology#featureCode') }
    specify { rdf.should include('http://www.geonames.org/ontology#parentFeature') }
  end
end
