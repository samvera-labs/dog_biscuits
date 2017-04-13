# frozen_string_literal: true

shared_examples_for 'official_url' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has official_url' do
    expect(@stubby.official_url).to eq(['http://www.london.ac.uk'])
  end
  it 'has official_url predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#officialUrl')))
  end
end
