# frozen_string_literal: true

shared_examples_for 'publisher' do
  let(:publisher) { FactoryGirl.build(:organisation) }

  before do
    stubby.publisher_resource << publisher
  end
  it 'has publisher' do
    expect(stubby.publisher).to eq(['Rough Trade Records'])
  end
  it 'has publisher resource' do
    expect(stubby.publisher_resource.first).to eq(publisher)
  end
  it 'has publisher predicate' do
    expect(rdf.should(include('http://purl.org/dc/elements/1.1/publisher')))
  end
  it 'has pbl predicate' do
    expect(rdf.should(include('http://id.loc.gov/vocabulary/relators/pbl')))
  end
  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('publisher_label_tesim')))
  end

  it 'is in the solr_document' do
    expect(solr_doc.should(respond_to(:publisher)))
  end

  it 'is in the configuration property_mappings' do
    expect(DogBiscuits.config.property_mappings[:publisher].should(be_truthy))
  end

  # TODO: label
  it 'is in the properties' do
    expect(DogBiscuits.config.send("#{stubby.class.to_s.underscore}_properties").should(include(:publisher)))
  end
end
