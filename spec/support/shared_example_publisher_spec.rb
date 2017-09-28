# frozen_string_literal: true

shared_examples_for 'publisher' do
  # the class that includes the concern

  let(:publisher) { FactoryGirl.build(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }

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
end
