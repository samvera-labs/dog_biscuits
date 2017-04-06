shared_examples_for 'simple_versions' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::').last
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @replaces = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
    @replaced_by = FactoryGirl.build_stubbed(model_str.underscore.to_sym)

    @stubby.replaces << @replaces
    @stubby.replaced_by << @replaced_by
  end

  it 'replaces' do
    expect(@stubby.replaces.first).to eq(@replaces)
  end
  it 'is inverse of replaces' do
    expect(@replaces.replaced_by.first).to eq(@stubby)
  end
  it 'is replaced by' do
    expect(@stubby.replaced_by.first).to eq(@replaced_by)
  end
  it 'is inverse of replaces' do
    expect(@replaced_by.replaces.first).to eq(@stubby)
  end
end
