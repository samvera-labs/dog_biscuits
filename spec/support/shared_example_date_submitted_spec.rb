# frozen_string_literal: true

shared_examples_for 'date_submitted' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has date submitted' do
    expect(stubby.date_submitted).to eq('2013')
  end
  it 'has date submitted predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://london.ac.uk/ontologies/terms#dateSubmitted')))
  end
end
