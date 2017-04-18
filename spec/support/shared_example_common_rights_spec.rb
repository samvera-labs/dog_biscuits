# frozen_string_literal: true

shared_examples_for 'common_rights' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has rights holder' do
    expect(stubby.rights_holder).to eq(['Johnny Marr'])
  end
  it 'has rights statement' do
    expect(stubby.rights_statement).to eq(['http://rightsstatements.org/vocab/InC/1.0/'])
  end
  it 'has license' do
    expect(stubby.license).to eq(['https://creativecommons.org/publicdomain/mark/1.0/'])
  end
  it 'has rights description' do
    expect(stubby.rights_description).to eq(['some additoinal stuff about rights'])
  end
  it 'has rightsholder predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/rightsHolder')))
  end
  it 'has dc rights predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/rights')))
  end
  it 'has dc11 rights predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/rights')))
  end
  it 'has edm rights predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.europeana.eu/schemas/edm/rights')))
  end
end
