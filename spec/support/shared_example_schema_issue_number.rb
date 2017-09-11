# frozen_string_literal: true

shared_examples_for 'issue_number' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has issue number' do
    expect(stubby.issue_number).to eq(['issue_number_test'])
  end
  it 'has issue number predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://schema.org/issueNumber')))
  end
end
