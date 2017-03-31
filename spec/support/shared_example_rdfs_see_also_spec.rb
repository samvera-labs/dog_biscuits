shared_examples_for 'rdfs_see_also' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    model_u = 'seealso_' + model_str.underscore
    @stubbier = FactoryGirl.build_stubbed(model_u.underscore.to_sym)
  end
  before(:each) do
    @stubby.see_also << @stubbier
  end

  it 'has see_also' do
    expect(@stubby.see_also.first.preflabel).to eq('seealso object')
  end

  it 'has reciprocal see_also' do
    expect(@stubbier.see_also.first.preflabel).to eq('label')
  end
end
