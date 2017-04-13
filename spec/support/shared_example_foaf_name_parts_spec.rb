# frozen_string_literal: true

shared_examples_for 'foaf_name_parts' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has family name' do
    expect(stubby.family_name).to eq('Morrissey')
  end
  it 'has family name predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/familyName')))
  end
  it 'has given name' do
    expect(stubby.given_name).to eq('Stephen Patrick')
  end
  it 'has given name predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://xmlns.com/foaf/0.1/givenName')))
  end
end
