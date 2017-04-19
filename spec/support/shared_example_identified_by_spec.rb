# frozen_string_literal: true

shared_examples_for 'identified_by' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has identified_by' do
    expect(stubby.identified_by).to eq(['identified_by'])
  end
  it 'has identifier predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/identifiedBy')))
  end
end
