# frozen_string_literal: true

shared_examples_for 'subject' do
  it 'has subject (external)' do
    expect(stubby.subject).to eq(['Official Heading for Woe'])
  end
  it 'has dc11 subject predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/subject')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:subject)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:subject].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:subject)))
  end
end
