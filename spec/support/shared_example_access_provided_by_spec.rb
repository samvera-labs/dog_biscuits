# frozen_string_literal: true

shared_examples_for 'access_provided_by' do
  it 'has access_provided_by string' do
    expect(stubby.access_provided_by).to eq(['Rough Trade Records Archive'])
  end

  it 'has access_provided_by predicate' do
    expect(rdf.should(include('http://data.archiveshub.ac.uk/def/accessProvidedBy')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['access_provided_by_label_tesim'].should(include('Rough Trade Records Archive')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:access_provided_by)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:access_provided_by].should(be_truthy))
  end

  # TODO: label
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:access_provided_by)))
  end
end
