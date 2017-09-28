# frozen_string_literal: true

shared_examples_for 'in_journal' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'will be in a journal' do
    expect(stubby.journal).to eq(['The Journal of Woe'])
  end
  it 'has frbr:partOf predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end
end
