# frozen_string_literal: true

shared_examples_for 'issue_number' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has issue number' do
    expect(@stubby.issue_number).to eq('issue_number_test')
  end
  it 'has issue number predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/issueNumber')))
  end
end
