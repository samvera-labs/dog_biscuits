# frozen_string_literal: true

shared_examples_for 'for_indexing' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has for_indexing' do
    expect(stubby.for_indexing).to eq(['lovely stuff for indexing'])
  end
  it 'has for_indexing predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#forIndexing')))
  end
end
