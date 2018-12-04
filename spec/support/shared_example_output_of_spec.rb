# frozen_string_literal: true

shared_examples_for 'output_of' do
  it 'has output_of' do
    expect(stubby.output_of).to eq(['some project'])
  end
  it 'has orcid predicate' do
    expect(rdf.should(include('http://purl.org/cerif/frapo/isOutputOf')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:output_of)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:output_of].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:output_of)))
  end
end
