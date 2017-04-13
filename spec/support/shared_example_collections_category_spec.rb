# frozen_string_literal: true

shared_examples_for 'collections_category' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has collections_category' do
    expect(stubby.collections_category).to eq(['self-renewing'])
  end
  it 'has collections_category predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#collectionsCategory')))
  end
end
