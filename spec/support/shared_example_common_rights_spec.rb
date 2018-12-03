# frozen_string_literal: true

# rights_holder and description currently not in any models
shared_examples_for 'common_rights' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has rights holder' do
    expect(stubby.rights_holder).to eq(['Johnny Marr'])
  end
  it 'has rights statement' do
    expect(stubby.rights_statement).to eq(['http://rightsstatements.org/vocab/InC/1.0/'])
  end
  it 'has license' do
    expect(stubby.license).to eq(['https://creativecommons.org/publicdomain/mark/1.0/'])
  end
  it 'has rights description' do
    expect(stubby.rights_description).to eq(['some additional stuff about rights'])
  end
  it 'has rightsholder predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/rightsHolder')))
  end
  it 'has dc rights predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/rights')))
  end
  it 'has dc11 rights predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/rights')))
  end
  it 'has edm rights predicate' do
    expect(rdf.should(include('http://www.europeana.eu/schemas/edm/rights')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:license)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:license].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:license)))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:rights_statement)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:rights_statement].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:rights_statement)))
  end
end
