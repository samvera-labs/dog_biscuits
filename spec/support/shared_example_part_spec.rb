# frozen_string_literal: true

shared_examples_for 'part' do
  it 'has part' do
    expect(stubby.part).to eq(['Part One'])
  end
  it 'has part predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/part')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:part)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:part].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:part)))
  end
end
