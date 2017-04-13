# frozen_string_literal: true

shared_examples_for 'publisher' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @publisher = FactoryGirl.build(:organisation)
    @stubby.publisher_resource << @publisher
  end
  it 'has publisher' do
    expect(@stubby.publisher).to eq(['Rough Trade Records'])
    expect(@stubby.publisher_resource.first).to eq(@publisher)
  end
  it 'has publisher predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/publisher')))
    expect(@stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/relators/pbl')))
  end

  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('publisher_value_tesim')))
    expect(@stubby.to_solr.should(include('publisher_value_sim')))
  end
end
