# frozen_string_literal: true

shared_examples_for 'date_submitted' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has date submitted' do
    expect(stubby.date_submitted).to eq(['2013'])
  end
  it 'has date submitted predicate' do
    expect(rdf.should(include('http://london.ac.uk/ontologies/terms#dateSubmitted')))
  end
end
