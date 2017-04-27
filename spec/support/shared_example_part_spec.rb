# frozen_string_literal: true

shared_examples_for 'part' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has part' do
    expect(stubby.part).to eq(['Part One'])
  end
  it 'has part predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/part')))
  end
end
