# frozen_string_literal: true

shared_examples_for 'proceeding' do
  it 'has proceeding' do
    expect(stubby.proceeding).to eq(['Proceedings of the Conference of Misery'])
  end

  it 'has proceeding predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:proceeding)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:proceeding].should(be_truthy))
  end

  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:proceeding)))
  end
end
