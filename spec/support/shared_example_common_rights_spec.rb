# frozen_string_literal: true

shared_examples_for 'common_rights' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has rights holder' do
    expect(@stubby.rights_holder).to eq(['Johnny Marr'])
  end
  it 'has rights statement' do
    expect(@stubby.rights_statement).to eq(['rights_statement_test'])
  end
  it 'has license' do
    expect(@stubby.rights).to eq(['https://creativecommons.org/publicdomain/mark/1.0/'])
  end
  it 'has rightsholder predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/rightsHolder')))
  end
  it 'has rights predicates' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/rights')))
    expect(@stubby.resource.dump(:ttl).should(include('http://www.europeana.eu/schemas/edm/rights')))
  end
end
