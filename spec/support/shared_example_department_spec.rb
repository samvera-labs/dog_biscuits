# frozen_string_literal: true

shared_examples_for 'department' do
  it 'has department' do
    expect(stubby.department).to eq(['Departmtent of Worry and Woe'])
  end

  it 'has department predicate' do
    expect(rdf.should(include('http://schema.org/department')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:department)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:department].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:department)))
  end
end
