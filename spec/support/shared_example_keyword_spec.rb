# frozen_string_literal: true

shared_examples_for 'keyword' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has keyword' do
    expect(stubby.keyword).to eq(['northern misery'])
  end
  it 'has keywords predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/keywords')))
  end
end
