# frozen_string_literal: true

shared_examples_for 'available' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has date available' do
    expect(stubby.date_available).to eq(['2015'])
  end

  it 'has date available predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/available')))
  end
end
