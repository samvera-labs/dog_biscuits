# frozen_string_literal: true

shared_examples_for 'simple_versions' do
  let(:replaces) { FactoryBot.build(described_class.to_s.underscore.to_sym) }
  let(:replaced_by) { FactoryBot.build(described_class.to_s.underscore.to_sym) }

  before do
    stubby.replaces << replaces
    stubby.replaced_by << replaced_by
  end

  it 'replaces' do
    expect(stubby.replaces.first).to eq(replaces)
  end
  it 'is inverse of replaces' do
    expect(replaces.replaced_by.first).to eq(stubby)
  end
  it 'is replaced by' do
    expect(stubby.replaced_by.first).to eq(replaced_by)
  end
  it 'is inverse of replaces' do
    expect(replaced_by.replaces.first).to eq(stubby)
  end
end
