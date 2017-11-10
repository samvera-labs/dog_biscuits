# frozen_string_literal: true

shared_examples_for 'related' do
  model_str = described_class.to_s.to_s.split('::')[1]
  let(:stubby) { FactoryBot.build(model_str.underscore.to_sym) }
  model_u = 'related_' + model_str.underscore
  let(:stubbier) { FactoryBot.build_stubbed(model_u.underscore.to_sym) }

  before do
    stubby.related << stubbier
  end

  it 'has see_also' do
    expect(stubby.related.first.preflabel).to eq('related object')
  end

  it 'has reciprocal related' do
    expect(stubbier.related.first.preflabel).to eq('label')
  end
end
