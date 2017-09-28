# frozen_string_literal: true

shared_examples_for 'proceeding' do
  # the class that includes the concern

  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'has proceeding' do
    expect(stubby.proceeding).to eq(['Proceedings of the Conference of Misery'])
  end

  it 'has proceeding predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end
end
