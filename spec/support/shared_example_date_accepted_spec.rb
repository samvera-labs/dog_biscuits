# frozen_string_literal: true

shared_examples_for 'date_accepted' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has date accepted' do
    expect(stubby.date_accepted).to eq(['2014'])
  end
  it 'has date accepted predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/dateAccepted')))
  end
end
