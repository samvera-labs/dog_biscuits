# frozen_string_literal: true

shared_examples_for 'date_published' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has date_published' do
    expect(stubby.date_published).to eq(['2016'])
  end
  it 'has date published predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/datePublished')))
  end
end
