# frozen_string_literal: true

shared_examples_for 'date_of_award' do
  let(:rdf) { stubby.resource.dump(:ttl) }

  # metadata
  it 'has date of award' do
    expect(stubby.date_of_award).to eq(['2016-01-01'])
  end

  # predicates
  it 'has date of award predicate' do
    expect(rdf.should(include('http://purl.org/dc/terms/dateAccepted')))
  end
end
