# frozen_string_literal: true

shared_examples_for 'rdfs_see_also' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  model_str = described_class.to_s.to_s.split('::')[1]
  let(:stubby) { FactoryGirl.build(model_str.underscore.to_sym) }
  model_u = 'seealso_' + model_str.underscore
  let(:stubbier) { FactoryGirl.build_stubbed(model_u.underscore.to_sym) }

  before do
    stubby.see_also << stubbier
  end

  it 'has see_also' do
    expect(stubby.see_also.first.preflabel).to eq('seealso object')
  end

  it 'has reciprocal see_also' do
    expect(stubbier.see_also.first.preflabel).to eq('label')
  end
end
