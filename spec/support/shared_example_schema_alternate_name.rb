# frozen_string_literal: true

shared_examples_for 'schema_alternate_name' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has alternate name' do
    expect(stubby.alternate_name).to eq(['Ziggy Stardust'])
  end
  it 'has alternate name predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/alternateName')))
  end
end
