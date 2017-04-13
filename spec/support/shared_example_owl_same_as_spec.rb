# frozen_string_literal: true

shared_examples_for 'owl_same_as' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has same as' do
    expect(@stubby.same_as).to eq(%w[http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212])
  end
  it 'has same as predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.w3.org/2002/07/owl#sameAs')))
  end
end
