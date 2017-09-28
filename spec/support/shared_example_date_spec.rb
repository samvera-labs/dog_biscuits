# frozen_string_literal: true

shared_examples_for 'date' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has date' do
    expect(stubby.date).to eq(['2016-01-01'])
  end
  it 'has date predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/date')))
  end
end
