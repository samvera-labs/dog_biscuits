# frozen_string_literal: true

shared_examples_for 'isbn' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has isbn' do
    expect(stubby.isbn).to eq(['xxx-xxx-xxx'])
  end
  it 'has isbn predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://id.loc.gov/vocabulary/identifiers/isbn')))
  end
end
