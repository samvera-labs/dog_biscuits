# frozen_string_literal: true

shared_examples_for 'start_date' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has start_date' do
    expect(stubby.start_date).to eq(['1-1-2016'])
  end
  it 'has predicate' do
    expect(rdf.should(include('http://schema.org/startDate')))
  end
end
