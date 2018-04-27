# frozen_string_literal: true

shared_examples_for 'geo' do
  describe '#geo metadata' do
    specify { stubby.lat.should eq(['latitude']) }
    specify { stubby.long.should eq(['longitude']) }
    specify { stubby.alt.should eq(['altitude']) }
  end

  describe '#geo predicates' do
    specify { rdf.should include('http://www.w3.org/2003/01/geo/wgs84_pos#lat') }
    specify { rdf.should include('http://www.w3.org/2003/01/geo/wgs84_pos#long') }
    specify { rdf.should include('http://www.w3.org/2003/01/geo/wgs84_pos#alt') }
  end

  it 'is in the solr_document' do
    if stubby.work?
      expect(solr_doc.should(respond_to(:alt)))
      expect(solr_doc.should(respond_to(:lat)))
      expect(solr_doc.should(respond_to(:long)))
    end
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:alt].should(be_truthy))
    expect(DogBiscuits.config.property_mappings[:lat].should(be_truthy))
    expect(DogBiscuits.config.property_mappings[:long].should(be_truthy))
  end

  it 'is in the properties' do
    if stubby.work?
      expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:alt)))
      expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:lat)))
      expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:long)))
    end
  end
end
