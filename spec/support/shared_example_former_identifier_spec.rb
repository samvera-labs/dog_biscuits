# frozen_string_literal: true

shared_examples_for 'former_identifier' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has former identifier' do
    expect(stubby.former_id).to eq(['york:1234'])
  end
  it 'has former identifier predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#formerIdentifier')))
  end
end
