# frozen_string_literal: true

shared_examples_for 'last_access' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has last_access' do
    expect(stubby.last_access).to eq('2016-01-01')
  end
  it 'has last_access predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#lastAccess')))
  end
end
