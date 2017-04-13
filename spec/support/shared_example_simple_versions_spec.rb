# frozen_string_literal: true

shared_examples_for 'simple_versions' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:replaces) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:replaced_by) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

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
