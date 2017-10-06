# frozen_string_literal: true

shared_examples_for 'number_of_downloads' do
  it 'has number_of_downloads' do
    expect(stubby.number_of_downloads).to eq('52')
  end
  it 'has number_of_downloads predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#numberOfDownloads')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:number_of_downloads)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:number_of_downloads].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:number_of_downloads)))
  end
end
