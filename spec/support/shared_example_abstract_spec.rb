# frozen_string_literal: true

shared_examples_for 'abstract' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has abstract' do
    expect(stubby.abstract).to eq(['abstract'])
  end

  it 'has abstract predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/abstract')))
  end
end
