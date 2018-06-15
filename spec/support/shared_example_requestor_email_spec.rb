# frozen_string_literal: true

shared_examples_for 'requestor_email' do
  it 'has requestor_email' do
    expect(stubby.requestor_email).to eq(['me@example.com'])
  end
  it 'has requestor_email predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/generic#requestorEmail')))
  end
end
