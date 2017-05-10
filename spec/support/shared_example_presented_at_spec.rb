# frozen_string_literal: true

shared_examples_for 'presented_at' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:conference) { FactoryGirl.build_stubbed(:conference) }

  before do
    stubby.presented_at_resource << conference
  end
  it 'has conference' do
    expect(stubby.presented_at_resource.first).to eq(conference)
    expect(stubby.presented_at).to eq(['The International Conference of Misery'])
  end
  it 'has presented at predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/ontology/bibo/presentedAt')))
  end
end
