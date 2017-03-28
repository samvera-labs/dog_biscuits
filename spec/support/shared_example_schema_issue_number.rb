shared_examples_for 'issue_number' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have an issue number' do
    expect(@stubby.issue_number).to eq('issue_number_test')
  end
  it 'will have the schema:issueNumber predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/issueNumber')))
  end
end

