# frozen_string_literal: true

shared_examples_for 'place_properties' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  describe '#place metadata' do
    specify { stubby.feature_code.should eq(['city']) }
    specify { stubby.place_name.should eq('Didsbury') }
    specify { stubby.parent_ADM4.should eq('Madeup Parish') }
    specify { stubby.parent_ADM3.should eq('Manchester') }
    specify { stubby.parent_ADM2.should eq('Greater Manchester') }
    specify { stubby.parent_ADM1.should eq('England') }
    specify { stubby.parent_country.should eq('United Kingdom') }
    specify { stubby.parent_feature.should eq('Manchester') }
    specify { stubby.country_code.should eq('GBR') }
    specify { stubby.lat.should eq('latitude') }
    specify { stubby.long.should eq('longitude') }
    specify { stubby.alt.should eq('altitude') }
  end

  describe '#place predicates' do
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#name') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM4') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM3') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM2') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentADM1') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentCountry') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#featureCode') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#countryCode') }
    specify { stubby.resource.dump(:ttl).should include('http://www.geonames.org/ontology#parentFeature') }
    specify { stubby.resource.dump(:ttl).should include('http://www.w3.org/2003/01/geo/wgs84_pos#lat') }
    specify { stubby.resource.dump(:ttl).should include('http://www.w3.org/2003/01/geo/wgs84_pos#long') }
    specify { stubby.resource.dump(:ttl).should include('http://www.w3.org/2003/01/geo/wgs84_pos#alt') }
  end
end
