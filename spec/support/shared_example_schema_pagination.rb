# frozen_string_literal: true

shared_examples_for 'pagination' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has pagination' do
    expect(stubby.pagination).to eq(['pagination_test'])
  end
  it 'has pagination predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/pagination')))
  end
end
