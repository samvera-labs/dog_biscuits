# frozen_string_literal: true

shared_examples_for 'available' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end

  it 'has date available' do
    expect(@stubby.date_available).to eq('2015')
  end

  it 'has date available predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/available')))
  end
end
