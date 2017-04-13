# frozen_string_literal: true

shared_examples_for 'date' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has date' do
    expect(@stubby.date).to eq(['2016-01-01'])
  end
  it 'has date predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/date')))
  end
end
