shared_examples_for 'volume_number' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has volume number' do
    expect(@stubby.volume_number).to eq('volume_number_test')
  end
  it 'has volume number predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://schema.org/volumeNumber')))
  end
end

