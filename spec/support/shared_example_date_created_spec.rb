# frozen_string_literal: true

shared_examples_for 'date_created' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has date created' do
    expect(stubby.date_created).to eq(['2015-01-01'])
  end
  it 'has date accepted predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/created')))
  end
end
