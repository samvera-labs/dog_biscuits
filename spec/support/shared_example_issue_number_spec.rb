# frozen_string_literal: true

shared_examples_for 'issue_number' do
  it 'has issue number' do
    expect(stubby.issue_number).to eq(['issue_number_test'])
  end
  it 'has issue number predicate' do
    expect(rdf.should(include('http://schema.org/issueNumber')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:issue_number)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:issue_number].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:issue_number)))
  end
end
