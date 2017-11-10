# frozen_string_literal: true

shared_examples_for 'identified_by' do
  it 'has identified_by' do
    expect(stubby.identified_by).to eq(['identified_by'])
  end
  it 'has identifier predicate' do
    expect(rdf.should(include('http://id.loc.gov/ontologies/bibframe/identifiedBy')))
  end
end
