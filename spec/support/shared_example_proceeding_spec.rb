# frozen_string_literal: true

shared_examples_for 'proceeding' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has proceeding' do
    expect(stubby.proceeding).to eq(['Proceedings of the Conference of Misery'])
  end

  it 'has proceeding predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/ontologies/bibframe/partOf')))
  end
end
