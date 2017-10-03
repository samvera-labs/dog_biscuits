# frozen_string_literal: true

shared_examples_for 'end_date' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has end_date' do
    expect(stubby.end_date).to eq(['10-1-2016'])
  end
  it 'has predicate' do
    expect(rdf.should(include('http://schema.org/endDate')))
  end
end
