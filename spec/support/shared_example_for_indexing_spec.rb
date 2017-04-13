# frozen_string_literal: true

shared_examples_for 'for_indexing' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has for_indexing' do
    expect(@stubby.for_indexing).to eq(['lovely stuff for indexing'])
  end
  it 'has for_indexing predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#forIndexing')))
  end
end
